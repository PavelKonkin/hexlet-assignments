# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(self)
  end

  def attribute name, **options
    instance_variable_set "@#{name}", { type: options[:type] || nil, default: options[:default] }
    define_method name do
      convert(instance_variable_get("@#{name}"), (self.class.instance_variable_get "@#{name}")[:type])
    end
    define_method "#{name}=" do |value|
      instance_variable_set "@#{name}", value
    end
  end

  def initialize(attributes = {})
    self.class.instance_variables.each do |elem|
      default = self.class.instance_variable_get(elem)[:default]
      instance_variable_set elem, default # if !default.nil?
    end
    attributes.each_key do |key|
      if self.class.instance_variable_defined? "@#{key}"
        instance_variable_set "@#{key}", attributes[key] || self.class.instance_variable_get("@#{key}")[:default] || nil
      end
    end
  end

  def attributes
    instance_variables.each_with_object({}) do |elem, result|
      key_name = elem.to_s.slice(1, elem.to_s.size)
      result[key_name.to_sym] ||= convert(instance_variable_get(elem), self.class.instance_variable_get(elem)[:type])
    end
  end

  def convert(value, type)
    return nil if value.nil?

    case type
    when :datetime
      DateTime.parse value
    when :integer
      value.to_i
    when :string
      value.to_s
    when :boolean || nil
      value
    end
  end
end
# END

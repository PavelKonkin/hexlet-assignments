# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  include Comparable
  extend Forwardable
  attr_accessor :url

  def initialize(url)
    @url = URI(url)
  end

  def_delegators :@url, :scheme, :host, :port

  def query_params
    params_hash(url.query)
  end

  def query_param(key, value = nil)
    params_hash(url.query)[key] ||= value
  end

  def <=>(other)
    url_hash(url) <=> url_hash(other.url)
  end

  private

  def url_hash(uri_obj)
    { url: uri_obj.scheme, host: uri_obj.host, port: uri_obj.port, params: params_hash(uri_obj.query) }
  end

  def params_hash(query_string)
    return {} if query_string.nil?

    query_string.split('&').each_with_object({}) do |elem, params|
                                                   key_value = elem.split('=')
                                                   params[key_value.first.to_sym] = key_value.last
                                                 end
  end
end
# END

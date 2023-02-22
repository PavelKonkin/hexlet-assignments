# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  params_array = params.sort
  result = ''
  params_array.each_with_index do |param, index|
    result = if index.zero?
               "#{param[0]}=#{param[1]}"
             else
               "#{result}&#{param[0]}=#{param[1]}"
             end
  end
  result
end
# END
# rubocop:enable Style/For

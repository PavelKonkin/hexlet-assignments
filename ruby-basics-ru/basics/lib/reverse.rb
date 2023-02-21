# frozen_string_literal: true

# BEGIN
def reverse(string)
  result = ''
  string.each_char { |char| result = "#{char}#{result}" }
  result
end
# END

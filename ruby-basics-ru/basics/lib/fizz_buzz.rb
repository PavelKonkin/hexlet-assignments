# frozen_string_literal: true

# BEGIN
def fizz_buzz(start_num, end_num)
  return if end_num < start_num

  result = ''
  start_num.upto(end_num) do |number|
    result = if (number % 15).zero?
               "#{result} FizzBuzz"
             elsif (number % 5).zero?
               "#{result} Buzz"
             elsif (number % 3).zero?
               "#{result} Fizz"
             else
               "#{result} #{number}"
             end
  end
  result.strip
end
# END

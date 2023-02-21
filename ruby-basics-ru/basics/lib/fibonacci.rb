# frozen_string_literal: true

# BEGIN
def fibonacci(number)
  return nil if number.negative?

  fib_array = [0, 1]
  index = 2
  while fib_array.size <= number
    fib_array[index] = fib_array[index - 2] + fib_array[index - 1]
    index += 1
  end

  fib_array[number]
end
# END

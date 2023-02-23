# frozen_string_literal: true

# BEGIN
def get_same_parity(arr)
  arr.filter do |elem|
    elem.odd? == arr[0].odd?
  end
end

# END

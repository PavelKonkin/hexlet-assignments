# frozen_string_literal: true

# BEGIN
def anagramm_filter(word, arr)
  arr.filter do |elem|
    word.chars.sort == elem.chars.sort
  end
end
# END

# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  words_array = text.split
  result = ''
  words_array.each do |word|
    insert_word = if stop_words.include? word
                    '$#%!'
                  else
                    word
                  end
    result = "#{result} #{insert_word}"
  end
  result.strip
  # END
end

# rubocop:enable Style/For

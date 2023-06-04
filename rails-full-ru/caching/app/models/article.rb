# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    Rails.cache.fetch('date_of_reading') { Date.now }
  end
  # END
end

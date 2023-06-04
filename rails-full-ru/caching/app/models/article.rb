# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    Rails.cache.fetch('date_of_reading') { DateTime.now }
  end
  # END
end

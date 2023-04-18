class PostComment < ApplicationRecord
  belongs_to :post

  validates :body, length: { minimum: 10, maximum: 500 }
end

class Book < ApplicationRecord
  has_many :comments
  validates :title, presence: true
  validates :summary, presence: true, length: {minimum: 15}
  validates :author, presence: true
  validates :isbn, presence: true
end

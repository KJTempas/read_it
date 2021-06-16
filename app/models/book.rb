class Book < ApplicationRecord
    belongs_to :user
    has_many :book_categories
    has_many :categories, through: :book_categories
    validates :title, presence: true, length: { minimum: 6, maximum: 50 }
    validates :author, presence: true, length: { minimum: 6, maximum: 30 }
end
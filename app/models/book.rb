class Book < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 50 }
    validates :author, presence: true, length: { minimum: 6, maximum: 30 }
end
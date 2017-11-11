class Book < ApplicationRecord
  belongs_to :category
  has_many :users, through: :user_details
  has_many :users, through: :user_books
 
  validates :name, presence: true, uniqueness: true

end

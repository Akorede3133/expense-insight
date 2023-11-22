class Category < ApplicationRecord
  has_one_attached :icon
  belongs_to :user
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates :name, presence: true
end

class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses

  validates :name, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0.0 }
end

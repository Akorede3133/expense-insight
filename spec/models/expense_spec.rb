require 'rails_helper'

RSpec.describe 'Expense', type: :model do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(name: 'John', email: 'john@gmail.com', password: 'password') }
  let(:expense) { Expense.new(name: 'Dinner', amount: 20.0, author: user) }

  before { user.save }
  before { expense.save }

  context 'validity:' do
    it 'is valid with required attributes' do
      expect(expense).to be_valid
    end
    it 'shows the exact category name' do
      expect(expense.name).to eq('Dinner')
    end
  end

  context 'invialidity:' do
    it 'is not valid when name is not present' do
      expense.name = nil
      expect(expense).not_to be_valid
    end
    it 'is not valid when amount is not present' do
      expense.amount = nil
      expect(expense).not_to be_valid
    end
    it 'is not valid when amount is less or equal to zero' do
      expense.amount = 0
      expect(expense).not_to be_valid
    end
  end
end

require 'rails_helper'

RSpec.describe 'Expense', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(name: 'John', email: 'john@gmail.com', password: 'password') }
  let(:category) { Category.new(name: 'Entertainment', user:) }
  let(:expense) { Expense.new(name: 'Dinner', amount: 20, author: user) }
  let(:category_expense) { CategoryExpense.new(category:, expense:) }

  before { user.save }
  before { category.save }
  before { expense.save }
  before { category_expense.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end

  context 'Index' do
    it 'displays the content of the expense index page' do
      user.categories.each do |category|
        expect(page).to have_content(category.name)
        click_on category.name
        # puts page.body
        expect(page).to have_current_path(category_expenses_path(category))
        category.expenses.each do |expense|
          expect(page).to have_content(expense.name)
          expect(page).to have_content(expense.amount)
        end
        visit categories_path
      end
    end
  end

  context 'click events' do
    it 'navigates to the add new transaction page' do
      user.categories.each do |category|
        expect(page).to have_content(category.name)
        click_on category.name
        expect(page).to have_current_path(category_expenses_path(category))
        click_on 'Add a New Transaction'
        expect(page).to have_current_path(new_category_expense_path(category))
        visit categories_path
      end
    end
  end
end

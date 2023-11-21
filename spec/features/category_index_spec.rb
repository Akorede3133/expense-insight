require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'

  let(:user) { User.new(name: 'John', email: 'john@gmail.com', password: 'password') }
  let(:category) { Category.new(name: 'Entertainment', user:) }

  before { user.save }
  before { category.save }

  before(:each) do
    visit new_user_session_path
    fill_in 'Email', with: 'john@gmail.com'
    fill_in 'Password', with: 'password'

    click_on 'Log in'
  end

  context 'index' do
    it 'displays the categories created by the user' do
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path(categories_path)
      expect(page).to have_selector('a', text: 'Add a new category')
      user.categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end
  end

  context 'click events' do
    it 'navigates to add a new category page' do
      click_on 'Add a new category'
      expect(page).to have_current_path(new_category_path)
      expect(page).to have_content('Create a category')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Home', type: :feature do
  context 'Index' do
    it 'Shows home screen content' do
      visit root_path
      expect(page).to have_content('Expense Insight')
      expect(page).to have_selector('a', text: 'LOG IN')
      expect(page).to have_selector('a', text: 'SIGN UP')
    end
  end

  context 'Click events' do
    it 'navigates to the login page' do
      visit root_path
      click_on 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end
    it 'navigates to the sign up page' do
      visit root_path
      click_on 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end

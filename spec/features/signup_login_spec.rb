require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'SignupLogins', type: :feature do
  # rubocop:enable Metrics/BlockLength
  context 'existing users' do
    it 'can login with an exiting user' do
      create(:user, name: 'test')
      visit(login_path)
      within('form') do
        fill_in 'name', with: 'test'
      end
      click_button 'log in'
      expect(page).to have_content('Welcome back test, you are succesfully logged in')
    end

    it "can't sign up with an already exiting user" do
      create(:user, name: 'test')
      visit(signup_path)
      within('form') do
        fill_in 'user_name', with: 'test'
      end
      click_button 'sign up'
      expect(page).to have_content('User name already exists')
    end
  end

  context 'non existing users' do
    it "can't log in with a non exiting user" do
      visit(login_path)
      within('form') do
        fill_in 'name', with: 'test'
      end
      click_button 'log in'
      expect(page).to have_content('User does not exists')
    end

    it 'can sign up with a non exisiting user' do
      visit(signup_path)
      within('form') do
        fill_in 'user_name', with: 'test'
      end
      click_button 'sign up'
      expect(page).to have_content('User test has succesfully signed in')
    end
  end
end

require 'rails_helper'

# rubocop:disable Metrics/BlockLength

RSpec.feature 'CreatingObjects', type: :feature do
  # rubocop:enable Metrics/BlockLength
  context 'creating charity events' do
    it 'creates a new event' do
      user = create(:user, name: 'test')
      group = create(:group, name: 'group_test', user_id: user.id)
      visit(login_path)
      within('form') do
        fill_in 'name', with: 'test'
      end
      click_button 'log in'
      visit(new_charity_path)
      within('form') do
        fill_in 'charity_name', with: 'charity_test'
        fill_in 'charity_amount', with: 10
        select(group.name, from: 'charity_group_id')
      end
      click_button 'Save'
      expect(page).to have_content('Charity charity_test was succesfully created!')
    end
  end

  context 'creating groups' do
    it 'creates a group' do
      create(:user, name: 'test')
      visit(login_path)
      within('form') do
        fill_in 'name', with: 'test'
      end
      click_button 'log in'
      visit(new_group_path)
      within('form') do
        fill_in 'group_name', with: 'group_test'
        choose 'group_icon_otherpng'
      end
      click_button 'Save'
      expect(page).to have_content('Group group_test was succesfully created!')
    end
  end
end

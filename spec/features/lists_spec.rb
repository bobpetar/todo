require 'rails_helper'

RSpec.feature "Lists", type: :feature do
  context 'create new list' do
    before(:each) do
      User.new(email: 'email@example.com', password: 'password', password_confirmation: 'password').save
      visit root_path
      within('form') do
        fill_in 'Email', with: 'email@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end
    
    scenario 'should be successful' do
      within('form#new_list') do
        fill_in 'Description', with: 'RSpec'
        click_button 'Save'
      end
      expect(page).to have_content('RSpec')
    end

    scenario 'should fail' do
      within('form#new_list') do
        fill_in 'Description', with: ''
        click_button 'Save'
      end
      expect(page).to have_content('can\'t be blank')
    end
  end

  context 'destroy list' do
    before(:each) do
      User.new(email: 'email@example.com', password: 'password', password_confirmation: 'password').save
      visit root_path
      within('form') do
        fill_in 'Email', with: 'email@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end
    
    scenario 'should destroy list' do
      within('form#new_list') do
        fill_in 'Description', with: 'RSpec'
        click_button 'Save'
      end
      list = List.last
      find("#delete_list_#{list.id}").click
      expect(page).to have_content('List was deleted')
    end
  end    
end

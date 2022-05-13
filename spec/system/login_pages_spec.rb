require 'rails_helper'

RSpec.describe 'LoginPages', type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) { visit '/users/sign_in' }

  context 'Login page content' do
    it 'should have email field' do
      expect(page).to have_content('Email')
    end
    it 'should have password field' do
      expect(page).to have_content('Password')
    end
    it 'should have login button' do
      expect(page).to have_content('Log in')
    end
  end

  context 'Interractions' do
    it 'should throw an error if the inputs are not filled in' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'should throw an error if login inputs are incorrent' do
      user = build(:user)
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end

    it 'should throw an error if login inputs are incorrent' do
      @user = create(:user, name: 'user', email: 'text@gmail.com')
      @user.confirm
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to eq root_path
      # expect(page).to have_content('Signed in successfully')
    end
  end
end

require 'rails_helper'

RSpec.describe 'UserIndices', type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @user = create(:user, name: 'user', email: 'text@gmail.com')
    @user.confirm
     login_as(@user)
  end
  it 'should be able to view other users' do
    create(:user, name: 'other')
    visit '/'
    expect(page).to have_content('user')
  end
  context 'for each user' do
    let(:user) { create(:user, name: 'user') }
    it 'should be able to profile picture' do
      visit '/'
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
    it 'should be able to see the number of posts' do
      create(:post, author: user)
      visit '/'
      expect(page).to have_content('Number of posts: 1')
    end
  end
end
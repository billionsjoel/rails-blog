require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:example) do
      get user_posts_path(user_id:1)
    end
    it 'should respond with status ok' do
      expect(response).to have_http_status(200)
    end
    it 'should render the index template for posts' do
      expect(response).to render_template(:index)
    end
    it "should have text 'Showing all posts for user with id:'" do
    expect(response.body).to include('Showing all posts for user with id:')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts' do
    before(:example) do
      get user_posts_path(user_id:1)
    end
    it 'should respond with status ok' do
      expect(response).to have_http_status(200)
    end
  end
end

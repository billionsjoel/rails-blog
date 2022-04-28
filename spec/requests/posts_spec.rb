require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe "GET /users/:user_id/posts" do
    before(:example) do
      get user_posts_path(user_id: 1)
    end
    it "it should return an ok if response is ok" do
      expect(response).to have_http_status(200)
    end
    it "should render the template index" do
      expect(response).to render_template(:index)
    end
    it "should respond with 'Showing all posts for user with id:'" do
      expect(response.body).to include('Showing all posts for user with id:')
    end
  end
  describe "GET /users/:user_id/posts/:id" do
    before(:example) { get user_post_path(user_id: 1, id: 1) }
    it "should return an okay when response is 200" do
      expect(response).to have_http_status(:ok)
    end
    it "should render the template show" do
      expect(response).to render_template(:show)
    end
    it "should respond with 'Showing posts with Postid: 1 for user with id: 1'" do
      expect(response.body).to include('Showing posts with Postid: 1 for user with id: 1')
    end
  end
end

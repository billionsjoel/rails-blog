require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before(:example){get users_path}
    it "should return response ok" do
      expect(response).to have_http_status(:ok)
    end
    it "should render the index template" do
     expect(response).to render_template(:index)
    end
    it "should respond with 'Home page'" do
    expect(response.body).to include('Home page')
    end
  end

  describe "GET /users/:id" do
    
  end
end

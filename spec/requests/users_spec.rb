require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before(:example){get users_path}
    it "should return response ok" do
      expect(response).to have_http_status(:ok)
    end
  end
end

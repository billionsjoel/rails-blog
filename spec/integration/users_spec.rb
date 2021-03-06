# rubocop:disable Layout/LineLength:
# rubocop:disable Metrics/BlockLength:
# rubocop:disable Style/BlockDelimiters:

require 'swagger_helper'

describe 'Users API' do
  path '/api/v1/users/login' do
    post 'Authentication to get jwt token' do
      tags 'User'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response '200', 'Login Successful' do
        @user = FactoryBot.create(:user)
        email = @user.email
        let(:params) { { email: email, password: 'secret' } }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['token']).not_to be_empty
        end
      end

      response '401', 'Unauthorized' do
        let(:params) { { email: 'johndoe@gmail.com', password: 'sample' } }
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    get 'List of all users, ensure to add token as Authorization header' do
      tags 'User'
      produces 'application/json'
      security [JWT: {}]
      parameter name: 'Authorization', in: :header, type: :string
      response '200', 'Users list' do
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxNjUwLCJleHAiOjE2NTI1NTM3NTd9.f6qq8VRXV0Vs12-DEM8go7dKa1bkooaqN7HNUMny_do'
        end
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.length).to be > 0
        end
      end

      response '401', 'Users list' do
        let(:Authorization) { '' }
        run_test!
      end
    end
  end

  path '/api/v1/users/signup' do
    post 'Register a new user' do
      tags 'User Registration'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          Name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
          Bio: { type: :string },
          confirmed_at: { type: :string },
          Photo: { type: :string },
          role: { type: :string }
        },
        required: %w[Name email password password_confirmation Bio confirmed_at Photo role]
      }
      response '200', 'User created' do
        let(:params) {
          {
            Name: Faker::Name.name,
            email: Faker::Internet.email,
            password: 'secret',
            password_confirmation: 'secret',
            Bio: Faker::Lorem.sentence,
            confirmed_at: Time.now,
            Photo: Faker::Avatar.image,
            role: ''
          }
        }
        run_test!
      end

      response '401', 'Invalid request' do
        let(:params) { { email: '' } }
        run_test!
      end
    end
  end
end

# rubocop:enable Layout/LineLength:
# rubocop:enable Metrics/BlockLength:
# rubocop:enable Style/BlockDelimiters:

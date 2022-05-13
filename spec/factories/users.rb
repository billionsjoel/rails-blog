FactoryBot.define do
  factory :user do
    name { 'Name' }
    photo { 'MyString' }
    bio { 'My Bio' }
    email { 'name@gmail.com' }
    role { 'user' }
    password { 'MyPassword' }
    password_confirmation { 'MyPassword' }
    factory :admin do
      role { 'admin' }
    end
  end
end

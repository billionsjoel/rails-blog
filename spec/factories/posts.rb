FactoryBot.define do
  factory :post do
    factory :author do
      transient do
        post { build(:post) }
      end
    end

    title { 'title' }
    text { 'text' }
  end
end

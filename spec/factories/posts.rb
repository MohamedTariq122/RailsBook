
FactoryBot.define do
  factory :post do
    title { "Test Post" }
    content { "Test Content" }
    user
  end
end
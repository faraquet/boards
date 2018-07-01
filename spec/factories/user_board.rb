FactoryBot.define do
  factory :user_board do
    id 1
    name 'John'
    question 'What is it?'

    trait(:email) { email 'john@doe.com' }

    factory :user_board_with_email, traits: [:email]
  end
end
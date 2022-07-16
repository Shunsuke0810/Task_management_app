FactoryBot.define do
  factory :user do
    name { 'A' }
    email {'aaa@aaa.com'}
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    admin {'false'}
  end
end

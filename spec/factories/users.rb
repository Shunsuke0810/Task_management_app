FactoryBot.define do
  factory :user_a, :class => 'user' do
    id { 1 }
    name { 'A' }
    email {'aaa@aaa.com'}
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    admin {'false'}
  end
end

FactoryBot.define do
  factory :user_b, :class => 'user' do
    id { 2 }
    name { 'B' }
    email {'bbb@bbb.com'}
    password {'aaaaaa'}
    password_confirmation {'aaaaaa'}
    admin {'false'}
  end
end

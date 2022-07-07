FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    period { 2022-01-01 }
  end
end

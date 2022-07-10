FactoryBot.define do
  factory :task do
    title { 'A' }
    content { 'B' }
    period { 2022-01-01 }
    status { '未着手' }
  end
end

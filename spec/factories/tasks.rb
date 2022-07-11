FactoryBot.define do
  factory :task do
    title { 'A' }
    content { 'B' }
    period { Date.today }
    status { '未着手' }
    priority { '高' }
  end
end

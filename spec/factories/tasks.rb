FactoryBot.define do
  factory :task, :class => 'task' do
    id {1}
    user_id { 1 }
    title { 'A' }
    content { 'B' }
    period { Date.today }
    status { '未着手' }
    priority { '高' }
  end
end

FactoryBot.define do
  factory :label_ruby, :class => 'label' do
    name {'Ruby'}
    created_at { Date.today }
    updated_at { Date.today }
  end
end

FactoryBot.define do
  factory :label_php, :class => 'label' do
    name {'Php'}
    created_at { Date.today }
    updated_at { Date.today }
  end
end

FactoryBot.define do
  factory :label_python, :class => 'label' do
    name {'Python'}
    created_at { Date.today }
    updated_at { Date.today }
  end
end


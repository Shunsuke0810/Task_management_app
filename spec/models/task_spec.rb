require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '成功テスト', content: '成功テスト')
        expect(task).to be_valid
      end
    end
  end
  describe '検索機能' do
  let(:task) { FactoryBot.create(:task, title: 'A', content: 'B', period: '2022-01-01', status: '未着手') }
    context 'scopeメソッドでタイトルをあいまい検索' do
      it '一致するタイトルを抽出' do
        expect(Task.search_title('A')).to include(task)
      end
    end
    context 'scopeメソッドでステータスを検索' do
      it '一致するステータスを抽出' do
        expect(Task.search_status('未着手')).to include(task)
      end
    end
    context 'scopeメソッドであいまい検索とステータス検索を同時に行う' do
      it '一致する条件のタスクを抽出' do
        expect(Task.search_title_and_status(['A','未着手'])).to include(task)
      end
    end
  end
end
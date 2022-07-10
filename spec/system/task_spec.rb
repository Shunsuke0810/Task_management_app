require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  # describe '新規作成機能' do
  #   context 'タスクを新規作成した場合' do
  #     it '作成したタスクが表示される' do
  #       # task = FactoryBot.create(:task, title: '買い物', content: 'だいこん', period: '2022-01-01' )
  #       visit new_task_path
  #       fill_in 'task[title]', with: '買い物'
  #       fill_in 'task[content]', with:'だいこん'
  #       fill_in 'task[period]', with: Date.today
  #       select '未着手', from: 'task[status]'
  #       click_button 'commit'
  #       expect(page).to have_content '買い物'
  #       expect(page).to have_content 'だいこん'
  #       expect(page).to have_content Date.today
  #       expect(page).to have_content '未着手'
  #     end
  #   end
  # end

  # describe '一覧表示機能' do
  #   context '一覧画面に遷移した場合' do
  #     it '作成済みのタスク一覧が表示される' do
  #       task = FactoryBot.create(:task, title: 'task')
  #       visit tasks_path
  #       expect(page).to have_content 'task'
  #     end
  #   end
  #   context 'タスクが作成日時の降順に並んでいる場合' do
  #     it '新しいタスクが一番上に表示される' do
  #       FactoryBot.create(:task, title: 'first')
  #       FactoryBot.create(:task, title: 'second')
  #       visit tasks_path
  #       task_list = all('td').first
  #       expect(task_list).to  have_content 'second'
  #     end
  #   end
  #   context '終了期限でソートするリンクを押した場合' do
  #     it '終了期限の順にタスクが表示される' do
  #       FactoryBot.create(:task, title: 'first', period: Date.today )
  #       FactoryBot.create(:task, title: 'second', period: Date.today + 1.days)
  #       visit tasks_path(sort_update: "true")
  #       task_list = all('td').first
  #       expect(task_list).to  have_content 'second'
  #     end
  #   end
  # end

  # describe '詳細表示機能' do
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     it '該当タスクの内容が表示される' do
  #       task = FactoryBot.create(:task, title: 'task')
  #       visit task_path(task.id)
  #       expect(page).to have_content 'task'
  #     end
  #   end
  # end

  describe '検索機能' do
    context 'タイトル検索した場合' do
      it '任意のタイトルが表示される' do
      task = FactoryBot.create(:task, title: 'A', content: 'B', period: '2022-01-01', status: '未着手')
      visit tasks_path
      fill_in 'search_title', with: 'A'
      click_button 'commit'
      expect(page).to have_content 'A'
      end
    end

    # context '' do
    #   it '' do
    #   end
    # end
  end

end
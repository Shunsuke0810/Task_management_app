require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe 'ラベル作成機能' do
    before do
      FactoryBot.create(:user_a)
      FactoryBot.create(:label_ruby)
      FactoryBot.create(:label_php)
      FactoryBot.create(:label_python)
    end
    context 'タスク作成の際ラベルを選択' do
      it '選択したラベルが反映される' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit new_task_path
        fill_in 'task[title]', with: 'A'
        fill_in 'task[content]', with:'A'
        check 'Ruby'
        click_button 'commit'
        expect(page).to have_content 'Ruby'
      end
    end
    context 'タスク詳細を表示' do
      it '選択中のラベルが表示される' do
        FactoryBot.create(:task)
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit edit_task_path(id:1)
        check 'Ruby'
        click_button 'commit'
        visit task_path(id:1)
        expect(page).to have_content 'Ruby'
      end
    end
  end
end
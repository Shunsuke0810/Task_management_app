require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :system do

  describe 'ユーザー登録テスト' do
    context 'ユーザー新規登録した場合' do
      it 'ユーザーの新規登録ができる' do
        visit new_user_path
        fill_in 'user[name]', with: 'A'
        fill_in 'user[email]', with: 'aaa@aaa.com'
        fill_in 'user[password]', with: 'aaaaaa'
        fill_in 'user[password_confirmation]', with: 'aaaaaa'
        click_button 'commit'
        expect(page).to have_content 'A'
      end
    end
    context 'ユーザーがログインせずタスク一覧に飛ぶ' do
      it 'ログイン画面に遷移する' do
        current_user = nil
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end
end


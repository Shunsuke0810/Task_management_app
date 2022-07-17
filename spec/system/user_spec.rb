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

  describe 'セッション機能テスト' do
    before do
      FactoryBot.create(:user_a)
      FactoryBot.create(:user_b)
    end
    context 'ログインフォームを入力' do
      it 'ログインできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        expect(page).to have_content 'Aのタスク一覧'
      end
    end
    context 'ログインフォームを入力' do
      it 'ログインと同時に詳細画面に遷移' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        expect(current_path).to eq user_path(id:1)
      end
    end
    context 'ユーザーが他人の詳細画面に飛ぼうとする' do
      it '自分のタスク一覧画面に遷移' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit user_path(id:2)
        expect(current_path).to eq tasks_path
      end
    end
    context 'ログアウト操作を実行' do
      it 'ログアウトできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        click_link 'Logout'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

end


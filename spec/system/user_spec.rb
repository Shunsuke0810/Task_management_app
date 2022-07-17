require 'rails_helper'
RSpec.describe 'ユーザーモデル機能', type: :system do

  # describe 'ユーザー登録テスト' do
  #   context 'ユーザー新規登録した場合' do
  #     it 'ユーザーの新規登録ができる' do
  #       visit new_user_path
  #       fill_in 'user[name]', with: 'A'
  #       fill_in 'user[email]', with: 'aaa@aaa.com'
  #       fill_in 'user[password]', with: 'aaaaaa'
  #       fill_in 'user[password_confirmation]', with: 'aaaaaa'
  #       click_button 'commit'
  #       expect(page).to have_content 'A'
  #     end
  #   end
  #   context 'ユーザーがログインせずタスク一覧に飛ぶ' do
  #     it 'ログイン画面に遷移する' do
  #       current_user = nil
  #       visit tasks_path
  #       expect(current_path).to eq new_session_path
  #     end
  #   end
  # end

  # describe 'セッション機能テスト' do
  #   before do
  #     FactoryBot.create(:user_a)
  #     FactoryBot.create(:user_b)
  #   end
  #   context 'ログインフォームを入力' do
  #     it 'ログインできる' do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'aaa@aaa.com'
  #       fill_in 'session[password]', with: 'aaaaaa'
  #       click_button 'commit'
  #       expect(page).to have_content 'Aのタスク一覧'
  #     end
  #   end
  #   context 'ログインフォームを入力' do
  #     it 'ログインと同時に詳細画面に遷移' do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'aaa@aaa.com'
  #       fill_in 'session[password]', with: 'aaaaaa'
  #       click_button 'commit'
  #       expect(current_path).to eq user_path(id:1)
  #     end
  #   end
  #   context 'ユーザーが他人の詳細画面に飛ぼうとする' do
  #     it '自分のタスク一覧画面に遷移' do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'aaa@aaa.com'
  #       fill_in 'session[password]', with: 'aaaaaa'
  #       click_button 'commit'
  #       visit user_path(id:2)
  #       expect(current_path).to eq tasks_path
  #     end
  #   end
  #   context 'ログアウト操作を実行' do
  #     it 'ログアウトできる' do
  #       visit new_session_path
  #       fill_in 'session[email]', with: 'aaa@aaa.com'
  #       fill_in 'session[password]', with: 'aaaaaa'
  #       click_button 'commit'
  #       click_link 'Logout'
  #       expect(page).to have_content 'ログアウトしました'
  #     end
  #   end
  # end

  describe '管理画面のテスト' do
    before do
      FactoryBot.create(:user_a)
      FactoryBot.create(:user_admin)
    end
    context '管理ユーザーが管理画面にアクセスしようとする時'do
      it '管理画面にアクセスできる' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit admin_users_path
        expect(page).to have_content 'ユーザー一覧'
      end
    end
    context '一般ユーザーが管理画面にアクセスしようとした時'do
      it '自分のタスク一覧に遷移する' do
        visit new_session_path
        fill_in 'session[email]', with: 'aaa@aaa.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit admin_users_path
        expect(page).to have_content '管理者以外はアクセスできません'
      end
    end
    context '管理ユーザーが新規ユーザー(ユーザー名[test_user]を登録)'do
      it 'ユーザー一覧にユーザー名[test_user]が登録される' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit new_admin_user_path
        fill_in 'user[name]', with: 'test_user'
        fill_in 'user[email]', with: 'test_user@gmail.com'
        fill_in 'user[password]', with: 'aaaaaa'
        fill_in 'user[password_confirmation]', with: 'aaaaaa'
        click_button 'commit'
        visit admin_users_path
        expect(page).to have_content 'test_user'
      end
    end
    context '管理ユーザーがuser_aの詳細画面にアクセス'do
      it 'user_aの詳細画面が表示される' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        visit edit_admin_user_path(id:1)
        expect(current_path).to eq edit_admin_user_path(id:1)
      end
    end
    context '管理ユーザーが編集画面からuser_aのname:aをneme:cに変更'do
      it 'user_aのname:aがneme:cに変更される' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@admin.com'
        fill_in 'session[password]', with: 'aaaaaa'
        click_button 'commit'
        
      end
    end
    context ''do
      it '' do
      
      end
    end
  end

end


class Admin::UsersController < ApplicationController
  before_action :if_not_admin

  def index
    @users = User.all.includes(:tasks)
  end

  def new 
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to admin_users_path, notice: "新規ユーザーを登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end

  private

  def if_not_admin
    redirect_to tasks_path, notice: "管理者以外はアクセスできません" unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation, :admin)
  end

end

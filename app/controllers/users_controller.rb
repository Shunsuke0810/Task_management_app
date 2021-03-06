class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def show
    if current_user == User.find(params[:id]) || User.find_by(admin: true)
    @user = User.find(params[:id])
    @tasks = Task.where(user_id: @user.id)
    else
      redirect_to tasks_path
    end
  end

  def new
    if current_user.present?
      redirect_to tasks_path
    else
    @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation)
  end

end

class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  # before_action :skip_signup

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  # def skip_signup
  #   if current_user.present?
  #     redirect_to tasks_path
  #   else
  #     redirect_to new_task_path
  #   end
  # end

end

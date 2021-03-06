class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    if params[:search_title].present? && params[:search_status].present?
      search_title_and_status = [params[:search_title],params[:search_status]]
      @tasks = current_user.tasks.search_title_and_status(search_title_and_status).page(params[:page]).per(5)
    elsif params[:search_title].present?
      search_title = params[:search_title]
      @tasks = current_user.tasks.search_title(search_title).page(params[:page]).per(5)
    elsif params[:search_status].present?
      search_status = params[:search_status]
      @tasks = current_user.tasks.search_status(search_status).page(params[:page]).per(5)
    elsif params[:sort_period]
      @tasks = current_user.tasks.sort_period.page(params[:page]).per(5)
    elsif params[:sort_priority]
      @tasks = current_user.tasks.sort_priority.page(params[:page]).per(5)
    else
      @tasks = current_user.tasks.default.all.page(params[:page]).per(5)
      @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
    end
  end 

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :content, :period, :status, :priority, { label_ids: [] })
    end
end

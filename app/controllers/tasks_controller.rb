class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
      Task.all.each do |task|
      if @tasks.completed == true
        @task_done = "You have completed this task"
      else
        @task_done = "You have not completed this task yet"
      end
    end
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(strong_params)
    if @tasks.save
      redirect_to task_path(@tasks)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tasks.update(strong_params)
      redirect_to task_path(@tasks)
    else
      render :edit
    end
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def strong_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @tasks = Task.find(params[:id])
  end
end

class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task].permit(:title, :desc))

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(params[:task].permit(:title, :desc))
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
  end
end

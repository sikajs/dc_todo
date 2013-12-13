class TasksController < ApplicationController
  # action for creating one new todo task
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

  # action for listing todo task
  def index
    @tasks = Task.all
  end
  
  # action for showing single todo task
  def show
    @task = Task.find(params[:id])
  end

  # action for editing and updating todo task
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

  # action for deleting todo task
  def destroy	
	$task = Task.find(params[:id])
	$task.destroy

	redirect_to tasks_path
  end
  
  # action for mark one todo task complete
  def complete
	@task = Task.find(params[:id])
	@task.completed = TRUE;
	@task.completed_at = Time.now;
	
	if @task.save
      redirect_to @task
    else
      render 'index'
    end
  end
end

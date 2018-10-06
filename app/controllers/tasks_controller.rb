class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy]


	def index 
		@tasks = current_user.tasks
		respond_to do |format|
	      format.html { render :index }
	      format.json { render json: @tasks, status: 200 }
	    end
	end

	def new 
		@task = Task.new(user: current_user)
		@tasks = current_user.tasks
	end

	def create
		@task = Task.create(task_params)
		@task.user = current_user
		@task.save 
		# binding.pry
		respond_to do |format|
			format.json { render json: { html: render_to_string("tasks/_task.html.erb", layout: false, locals: { task: @task })} }
		end
	end

	def show
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @task, status: 200 }
	    end
	end

	def edit
	end

	def update
	    @task.update(task_params)
	    redirect_to user_tasks_path(@task.user, @task)
	end

	def destroy
		@task.destroy
	    redirect_to user_tasks_path(@task.user, @task)
	end




	private 


	def task_params
		params.require(:task).permit(:title, :description, :doctype, :due_date)
	end

	def set_task
		@task = Task.find(params[:id])
	end


end
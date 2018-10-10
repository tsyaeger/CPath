class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update, :destroy, :add_contact, :add_document, :add_job, :completed]


	def index 
		@tasks = current_user.tasks
		respond_to do |format|
	      format.html { render :index }
	      format.json { render json: @tasks, status: 200 }
	    end
	end


	def filter
		@filtered_tasks = current_user.tasks.filtered_task(params[:q])
		respond_to do |format|
			format.json { render json: { html: render_to_string("tasks/_filtered_tasks.html.erb", layout: false, locals: { filtered_tasks: @filtered_tasks })} }
		end
	end



	def completed
		# binding.pry
		completedStr= (params[:q])
		completedBool = completedStr.to_s == "true"
		@task.completed = completedBool
		@task.save
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @task, status: 200 }
	    end
	end



	def add_contact
		c_id = params[:task][:contact_id]
		contact = Contact.find(c_id)
		contact.tasks << @task
		contact.save
	end	


	def add_document
		d_id = params[:task][:document_id]
		document = Document.find(d_id)
		document.tasks << @task
		document.save
	end	


	def add_job
		j_id = params[:task][:job_id]
		job = Job.find(j_id)
		job.tasks << @task
		job.save
	end	


	def new 
		@task = Task.new(user: current_user)
		@tasks = current_user.tasks
	end


	def create
		@task = Task.create(task_params)
		@task.user = current_user
		@task.save 
		respond_to do |format|
			format.json { render json: { html: render_to_string("tasks/_task.html.erb", layout: false, locals: { task: @task })} }
		end
	end


	def show
		@task = Task.find_by(:id => params[:id], :user_id => current_user.id)

		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @task, status: 200 }
	    end
	end


	def edit
	end


	def update
	    @task.update(task_params)
	    redirect_to user_task_path(@task.user, @task)
	end


	def destroy
		@task.destroy
	    redirect_to new_user_task_path(current_user)
	end




	private 


	def task_params
		params.require(:task).permit(:title, :description, :doctype, :due_date)
	end


	def set_task
		@task = Task.find(params[:id])
	end


end

class JobsController < ApplicationController
	before_action :set_job, except: [:index, :filter, :new, :create]

	def index 
		@jobs = current_user.jobs
		respond_to do |format|
	      format.html { render :index }
	      format.json { render json: @jobs, status: 200 }
	    end
	end


	def next
		@next_job = @job.next
		respond_to do |format|
			format.html { redirect_to(user_job_path(@next_job.user, @next_job)) }
			format.json { render json: @next_job }
		end
	end


	def previous
		@previous_job = @job.previous
		respond_to do |format|
			format.html { redirect_to(user_job_path(@previous_job.user, @previous_job)) }
			format.json { render json: @previous_job }
		end
	end


	def filter
		# binding.pry
		@filtered_jobs = current_user.jobs.filtered_job(params[:q])
		respond_to do |format|
			format.json { render json: { html: render_to_string("jobs/_filtered_jobs.html.erb", layout: false, locals: { filtered_jobs: @filtered_jobs })} }
		end
	end


	def applied
		# binding.pry
		appStr = (params[:q])
		appBool = appStr.to_s == "true"
		@job.applied = appBool
		@job.save
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @job, status: 200 }
	    end
	end


	def add_contact
		c_id = params[:job][:contact_ids]
		contact = Contact.find(c_id)
		if !@job.contacts.include?(contact)
			@job.contacts << contact
		end

	end	


	def add_document
		d_id = params[:job][:document_ids]
		document = Document.find(d_id)
		if !@job.documents.include?(document)
			@job.documents << document
		end
	end	


	def unlink_contact
		binding.pry
		contact = Contact.find(params[contact_id])
		@job.contacts.delete(contact)
	end


	def new 
		@job = Job.new(user: current_user)
		@user = current_user
	end


	def create
		# must fix null posted_date issue
		@job = Job.create(job_params)
		@job.user = current_user
		@job.save 
		redirect_to user_jobs_path(current_user)
	end


	def show
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @job, status: 200 }
	    end
	end


	def edit
	end


	def update
	    @job.update(job_params)
	    redirect_to user_jobs_path(@job.user)
	end


	def destroy
		@job.destroy
	    redirect_to user_jobs_path(current_user)
	end



	private 


	def job_params
		params.require(:job).permit(:company, :position, :date_posted, :job_desc, :co_desc, :url, :applied)
	end


	def set_job
		@job = Job.find(params[:id])
	end




end

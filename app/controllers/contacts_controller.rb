class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy, :add_reference]

	def index 
		@contacts = current_user.contacts
		respond_to do |format|
	      format.html { render :index }
	      format.json { render json: @contacts, status: 200 }
	    end
	end


	def filter
		@filtered_contacts = current_user.contacts.filtered_contact(params[:q])
		respond_to do |format|
			format.json { render json: { html: render_to_string("contacts/_filtered_contacts.html.erb", layout: false, locals: { filtered_contacts: @filtered_contacts })} }
		end
	end


	def add_reference
		refStr= (params[:q])
		refBool = refStr.to_s == "true"
		@contact.reference = refBool
		flash[:notice] = "Reference status has changed"
		@contact.save
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @contact, status: 200 }
	    end
	end


	def new 
		@contact = Contact.new(user: current_user)
		@contacts = current_user.contacts
	end


	def create
		@contact = Contact.create(contact_params)
		@contact.user = current_user
		@contact.save 

		respond_to do |format|
			format.json { render json: { html: render_to_string("contacts/_contact.html.erb", layout: false, locals: { contact: @contact })} }
		end
	end


	def show
		respond_to do |format|
	      format.html { render :show }
	      format.json { render json: @contact, status: 200 }
	    end
	end


	def edit
	end


	def update
		flash[:notice] = "Contact updated"
	    @contact.update(contact_params)
	    redirect_to user_contact_path(@contact.user, @contact)
	end


	def destroy
		flash[:notice] = "Contact destroyed"
		@contact.destroy
		redirect_to new_user_contact_path(current_user)
	end



	private 


	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :workplace, :linkedin, :phone, :email, :reference)
	end


	def set_contact
		@contact = Contact.find(params[:id])
	end



end

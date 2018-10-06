class DocumentsController < ApplicationController
	before_action :set_document, only: [:show, :edit, :update, :destroy] 


	def index 
		@document = Document.all
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @document, status: 200 }
		end
	end

	def new 
		@document = Document.new(user: current_user)
		@documents = current_user.documents
	end

	def create
		@document = Document.create(document_params)
		@document.user = current_user
		@document.save 
		respond_to do |format|
			format.json { render json: { html: render_to_string("document/_document.html.erb", layout: false, locals: { document: @document })} }
		end
	end

	def show
		respond_to do |format|
			format.html { render :show }
			format.json { render json: @document, status: 200 }
		end
	end

	def edit
	end

	def update
	    @document.update(document_params)
	    redirect_to user_document_path(@document.user, @document)
	end

	def destroy
		@document.destroy
		redirect_to user_document_path
	end




	private 


	def document_params
		params.require(:document).permit(:url, :description, :doctype)
	end


	def set_document 
		@document = Document.find(params[:id])
	end




end

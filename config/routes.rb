Rails.application.routes.draw do

	patch '/users/:id/jobs/:id/add_contact', to: 'jobs#add_contact', as: 'add_job_contact'
	patch '/users/:id/jobs/:id/add_document', to: 'jobs#add_document', as: 'add_job_document'
	# patch '/users/:id/jobs/:id/remove_contact' => 'jobs#remove_contact', as: 'remove_job_contact'


	get '/users/:id/jobs/:id/next', to: 'jobs#next', as: 'user_job_next'
	get '/users/:id/jobs/:id/previous', to: 'jobs#previous', as: 'user_job_previous'

	get '/jobs/filter', to: 'jobs#filter', as: 'jobs_filter'
	get '/contacts/filter', to: 'contacts#filter', as: 'contacts_filter'	
	get '/tasks/filter', to: 'tasks#filter', as: 'tasks_filter'
	get '/documents/filter', to: 'documents#filter', as: 'documents_filter'

	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	resources :users do 
		resources :contacts 
		resources :documents
		resources :jobs
		resources :tasks
	end


	root "static_pages#home"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

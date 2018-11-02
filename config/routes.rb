Rails.application.routes.draw do

	patch '/users/:id/jobs/:id/add_contact', to: 'jobs#add_contact', as: 'add_job_contact'
	patch '/users/:id/jobs/:id/add_document', to: 'jobs#add_document', as: 'add_job_document'

	get '/users/:id/jobs/:id/unlink_contact', to: 'jobs#unlink_contact', as: 'unlink_job_contact'
	get '/users/:id/jobs/:id/unlink_document', to: 'jobs#unlink_document', as: 'unlink_job_document'



	patch '/users/:id/tasks/:id/add_contact', to: 'tasks#add_contact', as: 'add_task_contact'
	patch '/users/:id/tasks/:id/add_document', to: 'tasks#add_document', as: 'add_task_document'
	patch '/users/:id/tasks/:id/add_job', to: 'tasks#add_job', as: 'add_task_job'

	get '/users/:id/tasks/:id/unlink_contact', to: 'tasks#unlink_contact', as: 'unlink_task_contact'
	get '/users/:id/tasks/:id/unlink_document', to: 'tasks#unlink_document', as: 'unlink_task_document'
	get '/users/:id/tasks/:id/unlink_job', to: 'tasks#unlink_job', as: 'unlink_task_job'



	get '/users/:id/contacts/:id/add_reference', to: 'contacts#add_reference', as: 'add_reference'
	get '/users/:id/jobs/:id/applied', to: 'jobs#applied', as: 'applied'
	get '/users/:id/tasks/:id/completed', to: 'tasks#completed', as: 'completed'



	get '/users/:id/jobs/:id/next', to: 'jobs#next', as: 'user_job_next'
	get '/users/:id/jobs/:id/previous', to: 'jobs#previous', as: 'user_job_previous'


	get '/users/:id/contacts/sort', to: 'contacts#sort', as: 'contacts_sort'


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

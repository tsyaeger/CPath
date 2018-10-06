Rails.application.routes.draw do
  resources :job_documents
  resources :job_contacts
  resources :tasks
  resources :documents
  resources :jobs
  resources :contacts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

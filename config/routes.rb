Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users

  resources :categories do
    resources :task_details, as: :task
end

  root "categories#index"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

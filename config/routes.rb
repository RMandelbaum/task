Rails.application.routes.draw do

  #Resources for user login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #Resource for possible statistics
  get '/tasks/statistics' => 'task_details#task_stats'

  #resource for users to sign up and view show page/allows for future iOS compatability
  resources :users, only: [:index, :new, :create, :show]
  resources :user, only: [:new, :create, :show], :user_agent => /iPhone/, :format => :iphone

  resources :categories do
    resources :task_details, as: :task
  end

  get '/tasks/home' => 'task_details#home'

  root "categories#index"

end

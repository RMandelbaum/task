Rails.application.routes.draw do
  resources :task_details, as: :task
  # resources :responses
  # resources :questions
  # resources :tasks

  resources :categories


  root "categories#index"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

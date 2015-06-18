Rails.application.routes.draw do
  
  # resources :questions, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  # resources :teachers do 
  #   resources :questions, :answers
  # end

  # resources :students do
  #   resources :questions, :answers
  # end

  resources :questions do
    resources :answers
  end

  root 'sessions#new'

end

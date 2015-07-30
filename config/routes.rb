Rails.application.routes.draw do
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :questions do
    resources :answers
  end

  resources :lessons

  root 'sessions#new'

end

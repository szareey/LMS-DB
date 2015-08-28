Rails.application.routes.draw do
  
  delete :sessions, to: 'sessions#destroy'
  resources :sessions, only: [:new, :create]

  resources :ministry_courses

  resources :questions do
    resources :answers
  end
  resources :answers
  
  resources :lessons

  root 'sessions#new'

end

Rails.application.routes.draw do

  delete :sessions, to: 'sessions#destroy'
  resources :sessions, only: [:new, :create]

  resources :ministry_courses
  resources :questions do
    resources :answers
    collection do
      resources :image_uploads, controller: 'questions/image_uploads', only: [:create]
    end
  end

  resources :answers
  resources :lessons

  root 'general#index'

  get 'auth/google_oauth2/callback', to: 'sessions#create'

end

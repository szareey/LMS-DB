Rails.application.routes.draw do
  
  resources :teachers do
    resources :questions do
      resources :answers
    end
  end

  resources :students do
    resources :answers
  end

  root 'question#show'

end

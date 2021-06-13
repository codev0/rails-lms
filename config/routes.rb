Rails.application.routes.draw do
  root 'home#index'

  resources :courses do
    resources :lessons
  end
  resources :lessons
  resources :examinations
  resources :questions do
    resources :answers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

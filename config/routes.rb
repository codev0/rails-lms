Rails.application.routes.draw do
  root 'home#index'

  resources :courses do
    resources :lessons
  end
  resources :lessons

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

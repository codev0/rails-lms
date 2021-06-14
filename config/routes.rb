Rails.application.routes.draw do
  root 'home#index'

  resources :courses do
    resources :lessons
  end

  resources :examinations do
    resources :questions
  end

  post '/examinations/:id/check', to: 'examinations#check', as: 'examination_check'

  resources :questions do
    resources :answers
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

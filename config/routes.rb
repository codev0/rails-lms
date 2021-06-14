Rails.application.routes.draw do
  root 'home#index'

  resources :courses do
    resources :lessons
  end
  resources :lessons

  resources :examinations do
    resources :questions
  end

  post '/examinations/:id/check', to: 'examinations#check', as: 'examination_check'

  resources :questions do
    resources :answers
  end

  get '/profile', to: 'pages#profile', as: 'page_profile'
  get '/profile-courses', to: 'pages#profile_courses', as: 'page_profile_courses'
  get '/calendar', to: 'pages#calendar', as: 'page_calendar'
end

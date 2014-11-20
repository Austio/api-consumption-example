Rails.application.routes.draw do
  devise_for :users

  resources :courses, only: [:index, :show]
  resources :enrollments, only: [:index, :create]

  root "courses#index"
end

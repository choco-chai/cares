Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  root to: "schedules#index"
  resources :schedules, only: [:index, :new, :show]
  resources :care_users, only: [:new, :create]
end

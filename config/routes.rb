Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  root to: "care_users#index"
  resources :schedules, only: [:index, :new, :show]
  resources :care_users, only: [:index, :new, :create]
end

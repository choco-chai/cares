Rails.application.routes.draw do
  devise_for :users
  root to: "care_users#index"
  resources :care_users, only: [:index, :new, :create, :destroy] do
    resources :schedules do
      get "past", on: :member
      resources :comments, only: :create
    end
  end
end

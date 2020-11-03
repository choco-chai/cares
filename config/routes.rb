Rails.application.routes.draw do
  devise_for :users
  root to: "care_users#index"
  resources :care_users, only: [:index, :new, :create] do
    resources :schedules, only: [:index, :new, :create, :show]
  end
end

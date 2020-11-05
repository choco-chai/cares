Rails.application.routes.draw do
  devise_for :users
  root to: "care_users#index"
  resources :care_users, only: [:index, :new, :create, :destroy] do
    resources :schedules, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
end

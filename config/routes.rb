Rails.application.routes.draw do
  devise_for :users
  # root to: "posts#index"
  root to: "news#index"
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :news, only: :index
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'about' => 'about#index'
  resources :users, only: [:show, :index, :edit, :update]
end

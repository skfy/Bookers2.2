Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  get 'about' => 'about#index'
  post 'books' => 'books#create'
  resources :users, only: [:show, :index]
end

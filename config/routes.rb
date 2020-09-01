Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friendlist', to: 'users#my_friendlist'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
end

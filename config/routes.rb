Rails.application.routes.draw do
  get 'downgrade/new'
  get 'charges/new'

  devise_for :users

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]

  post 'downgrade/create'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end

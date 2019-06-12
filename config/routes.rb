Rails.application.routes.draw do


  devise_for :admins


  namespace :admin do
      resources :users
      resources :products
      resources :orders
      resources :line_items
      resources :categories

      root to: "users#index"
  end

  devise_for :users, controllers: {
      registrations: 'registrations' ,
      confirmations: 'confirmations'
  }

  devise_scope :user do
    get 'sign_up', to: 'devise/sessions#create'
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end


  resources :products, only: [:index, :show]
  resources :line_items, only: [:create, :update, :destroy]
  resources :categories, only: [:show]

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

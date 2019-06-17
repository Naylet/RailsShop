Rails.application.routes.draw do

  devise_for :admin_users

  devise_for :users, controllers: {
      # registrations: 'registrations' ,
      confirmations: 'confirmations'
  }

  devise_scope :user do
    get 'sign_up', to: 'devise/sessions#create'
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :users
    resources :products
    resources :orders
    resources :line_items
    resources :categories

    root to: "users#index"
  end

  resources :products, only: [:index, :show]
  resources :line_items, only: [:create, :update, :destroy]

  # get 'products/category/:id', to:'categories#show', as: :category

  get 'cart', to: 'cart#show'

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'cart#add', as: :add_to
    put 'remove/:product_id', to: 'cart#remove', as: :remove_from
    put 'remove_one/:product_id', to: 'cart#remove_one', as: :remove_one
    post 'order_products', to:'cart#order_products', as: :order_products
  end

  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

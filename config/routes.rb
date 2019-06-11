Rails.application.routes.draw do

  resources :line_items
  resources :orders
  namespace :admin do
      resources :users
      resources :products
      resources :orders
      resources :line_items

      root to: "users#index"
  end

  # resources :order_products
  # resources :orders
  # resources :products
  # get 'store/index'
  devise_for :users, controllers: {
      registrations: 'registrations' ,
      confirmations: 'confirmations'
  }

  devise_scope :user do
    get 'sign_up', to: 'devise/sessions#create'
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
  end


  root to: 'store#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

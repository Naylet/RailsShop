Rails.application.routes.draw do


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


  resources :products
  root to: 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

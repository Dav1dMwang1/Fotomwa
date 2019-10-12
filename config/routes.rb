require 'sidekiq/web'
Rails.application.routes.draw do
  # Devise routes
  devise_for :users,
             controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' },
             path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification',
                                         unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # Frontend routes (Welcome Homepage)
  scope module: 'frontend' do
    get '/', to: 'homepage#home'
  end

  root to: 'users/dashboard#index'
  # User routes
  scope module: :users do
    # Dashboard Views
    get 'users', to: 'dashboard#index'
    scope module: :dashboard do
      # Admin
      get 'admin', to: 'admin_dashboard#index'
      namespace :admin do
        resources :brands,  :products,  :categories
      end

      # Customer
      get 'customers', to: 'customer_dashboard#index'
      namespace :customers do
        resources :orders
      end
    end
  end

mount Sidekiq::Web => '/sidekiq'
end

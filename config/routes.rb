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
  # resources :users
  scope module: :users do
    # User Settings
    # get 'profile', to: 'user#show', as: :user_profile
    # Dashboard Views
    get 'users', to: 'dashboard#index'
    scope module: :dashboard do
      # Admin
      get 'admin', to: 'admin_dashboard#index'
      namespace :admin do
        # User Profile
        resources :profiles, only: [ :show, :edit, :destroy, :update ]
        # Brands, Categories and Products
        resources :brands,  :products,  :categories
        # All Users in the System
        get 'sys_users', to: 'profiles#index', as: :sys_users
        # All Orders in the System
        get 'sys_orders', to: 'orders#index', as: :orders
        # Reports
        get 'reports', to: 'reports#index', as: :order_reports
        namespace 'reports' do
          get 'created', as: :created
          get 'editing', as: :edits
          get 'printing', as: :prints
          get 'studio', as: :studio
          get 'complete', as: :complete
        end
      end

      # Customer
      get 'customers', to: 'customer_dashboard#index'
      namespace :customers do
        # User Profile
        resources :profiles, only: [ :show, :edit, :destroy, :update ]
        # get '/profile/:id', to: 'profiles#show', as: :profile
        # Order Making
        resources :orders
        # Settings
        namespace 'settings' do
          get 'preferences', as: :preferences
          get 'payments', as: :payments
        end
        # Gallery
        get 'gallery', to: 'photos#index', as: :gallery
        # Notifications
        get 'notifications', to: 'notifications#index', as: :notification
        # FAQs
        get 'faqs', to: 'faqs#index', as: :faqs
        # Privacy and Terms & Conditions
        get 'legal', to: 'legal#index', as: :legal
      end
    end
  end

mount Sidekiq::Web => '/sidekiq'
end

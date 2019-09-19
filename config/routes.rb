Rails.application.routes.draw do

  # Frontend routes
  scope module: 'frontend' do
    root to: 'homepage#home'
  end

  # User routes
  namespace :users do
    resources :users, except: :index

    # Dashboard Views
    get 'customers', to: 'dashboard/customers/customer_dashboard#customer', as: :customer_dashboard
    get 'admin', to: 'dashboard/admin/admin_dashboard#admin', as: :admin_dashboard

    # For the Login Sessions, With OAuth2 as well
    resources :sessions, only: [:new, :create, :destroy]
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
  end

  # Devise routes
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth'}

  devise_scope :users do
    # get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    # delete 'sign_out', :to => 'devise/sessions#destroy', as: :destroy_user_session
  end

  # authenticated :users do
  #   root 'dashboard#index', as: :authenticated_root
  # end
  #
  # unauthenticated :users do
  #   root 'homepage#home', as: :unauthenticated_root
  # end

end

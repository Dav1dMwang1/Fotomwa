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

  # User routes
  root to: 'dashboard/dashboard#index'
  namespace :users do
    # Dashboard Views
    get '', to: 'dashboard/dashboard#index'
    get 'customers', to: 'dashboard/customers/customer_dashboard#customer', as: :customer_dashboard
    get 'admin', to: 'dashboard/admin/admin_dashboard#admin', as: :admin_dashboard
    resources :orders
  end

end

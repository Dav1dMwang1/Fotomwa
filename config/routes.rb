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

  root to: 'users/dashboard/dashboard#index'
  # User routes
  namespace :users do
    # Dashboard Views
    scope module: 'dashboard' do
      get '', to: 'dashboard#index'
      namespace :admin do
        root to: 'admin_dashboard#admin'
        resources :brands,  :products,  :categories
      end
      namespace :customers do
        root to: 'customer_dashboard#customer'
      end
    end
    # get 'customers', to: 'dashboard/customers/customer_dashboard#customer', as: :customers
    # get 'admin', to: 'dashboard/admin/admin_dashboard#admin', as: :admin
  end

end

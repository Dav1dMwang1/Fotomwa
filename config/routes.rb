Rails.application.routes.draw do
  # Frontend routes
  scope module: 'frontend' do
    root to: 'homepage#home'
  end

  # Admin routes
  namespace :admin do
    root to: 'admin_dashboard#index'
    resource :admin_dashboard, only: :index
  end

  # Client routes
  namespace :customer do
    root to: 'customer_dashboard#index'
    resource :customer_dashboard, only: :index
  end

end

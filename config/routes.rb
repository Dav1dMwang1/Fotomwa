Rails.application.routes.draw do
  # Frontend routes
  scope module: 'frontend' do
    resources :homepage, only: :home
    root to: 'homepage#home'
  end
end

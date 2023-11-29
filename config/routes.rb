Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registraions: 'users/registraions'
  }
  root 'pages#home'
  get '/home', to: 'pages#home', as: 'home'
  get "up" => "rails/health#show", as: :rails_health_check
end

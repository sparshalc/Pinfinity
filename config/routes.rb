Rails.application.routes.draw do
  root 'pages#home'

  resources :rooms do
    resources :messages
  end
  
  get '/inbox', to: 'rooms#index', as: 'inbox'

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  
  get '/home', to: 'pages#home', as: 'home'

  get "up" => "rails/health#show", as: :rails_health_check
end

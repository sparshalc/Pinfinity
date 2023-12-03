Rails.application.routes.draw do
  resources :boards, except: %i[index] do
    resources :pins do 
      resources :comments
    end
  end
  
  root 'pages#home'

  resources :rooms do
    resources :messages
  end
  
  get '/inbox', to: 'rooms#index', as: 'inbox'

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  
  get 'user/:id/profile', to: 'pages#profile', as: 'profile'
  get 'feed', to: 'pages#feed', as: 'feed'
  get '/home', to: 'pages#home', as: 'home'

  get "up" => "rails/health#show", as: :rails_health_check
end

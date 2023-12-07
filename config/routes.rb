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
  get '/notifications', to: 'pages#notifications', as: 'notifications'
  get 'edit_description/:id', to: 'members#edit_description', as: 'edit_member_description'
  patch 'update_description', to: 'members#update_description', as: 'update_member_description'

  post 'followability/:id/follow', to: 'followability#follow', as: 'follow'
  post 'followability/:id/unfollow', to: 'followability#unfollow', as: 'unfollow'
  post 'followability/:id/accept', to: 'followability#accept', as: 'accept'
  post 'followability/:id/decline', to: 'followability#decline', as: 'decline'
  post 'followability/:id/cancel', to: 'followability#cancel', as: 'cancel'

  get "up" => "rails/health#show", as: :rails_health_check
end

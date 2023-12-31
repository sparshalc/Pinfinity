Rails.application.routes.draw do
  resources :boards, except: %i[index] do
    resources :pins do 
      resources :comments
    end
  end

  resources :likes, only: [:create, :destroy]

  resources :rooms do
    resources :messages
  end
  get '/inbox', to: 'rooms#index', as: 'inbox'
  
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  
  root 'pages#home'
  get 'user/:id/profile', to: 'pages#profile', as: 'profile'
  get 'feed', to: 'pages#feed', as: 'feed'
  get '/home', to: 'pages#home', as: 'home'
  get '/notifications', to: 'pages#notifications', as: 'notifications'

  get '/:id/followers', to: 'members#followers', as: 'followers'
  get '/:id/following', to: 'members#following', as: 'following'
  get 'edit_description/:id', to: 'members#edit_description', as: 'edit_member_description'
  patch 'update_description', to: 'members#update_description', as: 'update_member_description'
  get '/follow/notifications', to: 'members#notification_reqs', as: 'request_notification'
  get '/foryou', to: 'members#foryou', as: 'foryou'

  post 'followability/:id/follow', to: 'followability#follow', as: 'follow'
  post 'followability/:id/unfollow', to: 'followability#unfollow', as: 'unfollow'
  post 'followability/:id/accept', to: 'followability#accept', as: 'accept'
  post 'followability/:id/decline', to: 'followability#decline', as: 'decline'
  post 'followability/:id/cancel', to: 'followability#cancel', as: 'cancel'

  get '/dashboard', to: 'admin#dashboard', as: 'admin'

  get "up" => "rails/health#show", as: :rails_health_check
end

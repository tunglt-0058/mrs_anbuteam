Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "registrations",
    sessions: "sessions",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  root "pages#show", page_temp: "home"
  get "pages/:page_temp", to: "pages#show", as: "page"

  resources :users, only: [:show]
  resources :reviews do
    resources :activities, only: [:create, :destroy]
    resources :comments, except: :show
    resources :favorite_reviews, only: [:create, :destroy]
  end
  resources :comments do
    resources :reply_comments, except: :show
  end
  resources :genres
  resources :categories

  resources :movies do
  resources :favorite_movies, only: [ :create, :destroy ]
  resources :reviews
    member do
      :reviews
    end
  end

  resources :actors, only: [:show] do
    resources :favorite_actors, only: [:create, :destroy]
  end
  resources :not_found, only: :index

  resources :follow_users, only: :index
  resources :users, only: [:show, :update] do
    resources :relationships, only: [:create, :destroy]
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end
  resources :searches, only: [:index, :new]
end

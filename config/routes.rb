Rails.application.routes.draw do

  devise_for :users
  root to: 'foods#index'
  resources :foods do
    collection do
      get :search
    end
    resource :likes, only: [:create, :destroy]
    # resources :likes, only: [:index]これでランキング出るらしい
    resources :comments, only: :create
  end
  resources :users do
    resources :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
end

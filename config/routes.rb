Rails.application.routes.draw do

  devise_for :users
  root to: 'foods#index'
  resources :foods do
    collection do
      get :search
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show

end

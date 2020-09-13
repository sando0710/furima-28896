Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  

  resources :items do
    resources :exchanges, only: [:index, :new, :create]
  end
end

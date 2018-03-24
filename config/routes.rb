Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'
  
  resources :pages
  resources :games
  #じゃんけん用
  #root 'games#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

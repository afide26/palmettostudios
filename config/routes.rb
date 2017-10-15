Rails.application.routes.draw do
  devise_for :users
  root 'albums#index'
  get 'info' => 'album#info'
  resources :contacts
  resources :posts do
  	resources :comments
  end
  
end

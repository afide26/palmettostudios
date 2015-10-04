Rails.application.routes.draw do
  devise_for :users
  root "albums#index"
  resources :contacts
  resources :posts do
  	resources :comments
  end
  
end

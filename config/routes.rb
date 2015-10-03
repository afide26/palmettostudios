Rails.application.routes.draw do
  root "albums#index"
  resources :contacts
  resources :posts do
  	resources :comments
  end
  
end

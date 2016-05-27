Rails.application.routes.draw do
  root 'sellers#index'
  
  resources :sellers


end

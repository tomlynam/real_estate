Rails.application.routes.draw do
  root 'sellers#index'
  
  resources :sellers do
  	resources :homes
  end
end

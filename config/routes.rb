Rails.application.routes.draw do

  devise_for :users
  
  namespace :admin do
    resources :users do
      resources :user_details
    end  
  end
  
  resources :categories do 
   resources :books
  end
  
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

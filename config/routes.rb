Rails.application.routes.draw do
  devise_for :users
  root to: "inspirations#index"
  
   resources :inspirations
end

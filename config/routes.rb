Rails.application.routes.draw do
  root to: "inspiration#index"
  
   resources :inspirations
end

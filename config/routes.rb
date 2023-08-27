Rails.application.routes.draw do
  
  resources :quotes, except: %i[ show ]
  root "quotes#index"
  
end

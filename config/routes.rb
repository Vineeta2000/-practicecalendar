Rails.application.routes.draw do
 root to: "homes#index"
  devise_for :users , controllers: {registrations: "registrations" ,sessions: "sessions"}
   

   get 'homes/index'

   resources :homes
   resources :colleges
   resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

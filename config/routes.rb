Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'items#index'
  devise_for :users  
  resources :items, :users
  get  'static_pages/about'
  get  'static_pages/help'

  
end


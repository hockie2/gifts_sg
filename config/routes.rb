Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'

  devise_for :users
  resources :items, :users, :comments
  get  'static_pages/about'
  get  'static_pages/contactUs' => 'static_pages#contactUs'
  get  'static_pages/about' => 'static_pages#about'

  post '/items/:id/comments/new' => 'comments#create', as: 'add_comment'
  get "/items/:id/reserve" => 'items#reserve', as: 'reserved_item'

end
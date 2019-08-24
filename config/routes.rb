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

  get "/items/:id/release" => 'items#release', as: 'released_item'
  get "/items/:id/done" => 'items#done', as: 'done_item'
  get "/users/:id/reservedItem" => 'users#reservedItems', as: 'reservedItems'
  get "/users/:id/availableItem" => 'users#availableItems', as: 'availableItems'
  get "/users/:id/closedItem" => 'users#closedItems', as: 'closedItems'
  get "/users/:id/myReservedItem" => 'users#myReservedItems', as: 'myReservedItems'
end



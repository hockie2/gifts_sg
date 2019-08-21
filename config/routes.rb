Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'items#index'
  devise_for :users  
  resources :items, :users
  get "/items/:id/reserve" => 'items#reserve', as: 'reserved_item'
  get "/items/:id/release" => 'items#release', as: 'released_item'
  get "/items/:id/done" => 'items#done', as: 'done_item'
  
end


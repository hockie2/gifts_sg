Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'items#index'
  devise_for :users
  resources :items, :users, :comments

  get '/items/:id/comments/new' => 'comments#new'

end
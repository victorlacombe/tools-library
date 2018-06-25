Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  get 'tags/new'
  get 'tags/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tools, only: [:index, :show, :new, :create, :edit, :update]
end

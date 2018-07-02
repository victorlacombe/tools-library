Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  get 'tags/index'
  get 'tags/show'
  get 'tags/new'
  get 'tags/create'
  devise_for :users
  root to: 'tools#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tools, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :tags, only: [:new, :create]
  end
end

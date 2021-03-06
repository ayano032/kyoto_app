Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	root 'homes#top'

  get 'home/about' =>'homes#about'
  resources :users, only: [:show,:edit, :update,:index]do
    member do
     get 'following'
     get 'followers'
  end
  end
  resources :posts, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
   resource :favorites, only: [:create, :destroy]
   resource :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end

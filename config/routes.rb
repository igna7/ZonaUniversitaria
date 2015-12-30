Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  		get "dislike", to: "posts#downvote"
  	end
  	resources :comments, only: [:create, :destroy]
  end
  root 'posts#index'
end

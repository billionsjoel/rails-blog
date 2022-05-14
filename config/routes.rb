Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get '/', to: 'user#index'
  #get '/users/:id', to: 'user#show'
  #get '/users/:id/posts', to: 'posts#index'
  #get '/users/:id/posts/:postId', to: 'posts#show'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
        resources :likes, only:[:create]
    end
  end

  namespace :api do
    namespace :v1 do
      post 'users/login' => 'users#login'
      post  'users/posts/getpostcomments' => 'posts#list_comments'
      post 'users/posts/commentonpost' => 'posts#add_comment'
      resources :users, only: [:index, :show]
    end
  end
end

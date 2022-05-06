Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get '/', to: 'user#index'
  #get '/users/:id', to: 'user#show'
  #get '/users/:id/posts', to: 'posts#index'
  #get '/users/:id/posts/:postId', to: 'posts#show'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
      resources :comments, only: [:new, :create, :edit, :update]
    end
  end
end

Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], controller: 'user_posts'
  end
  resources :users do
    resources :posts do
      member do
        post 'like'
      end
      resources :comments
    end
  end  
end

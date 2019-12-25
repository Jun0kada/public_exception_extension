Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts

  namespace :admin do
    root to: 'posts#index'
    resources :posts
  end
end

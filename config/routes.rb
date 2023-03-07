Rails.application.routes.draw do
  get 'top_pages/index'
  get 'top_pages/help'
  get '/top_page',   to: 'top_pages#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'user_sessions#new'
  post   '/login',   to: 'user_sessions#create'
  delete '/logout',  to: 'user_sessions#destroy'
  resources :users
end


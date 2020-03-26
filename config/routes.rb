Rails.application.routes.draw do
  get 'users/create'
  get 'users/new'
  get 'articles/create'
  get 'articles/new'
  #get 'users/new'
  #get 'posts/show'
  #get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root   'articles#index'
  get    '/login',   to: 'sessions#new'
  post '/login' => 'sessions#create'
  get    '/signup',   to: 'users#new'
  post '/signup' => 'users#create'
  get '/logout',  to: 'sessions#destroy'
  get '/add_comment' => 'posts#new'
  post '/add_comment' => 'posts#create'
end

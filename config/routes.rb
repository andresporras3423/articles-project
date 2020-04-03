Rails.application.routes.draw do
  get 'categories/show'
  get 'categories/index'
 root   'articles#index'
  get    '/login',   to: 'sessions#new'
  post '/login' => 'sessions#create'
  get    '/signup',   to: 'users#new'
  post '/signup' => 'users#create'
  get '/logout',  to: 'sessions#destroy'
  get '/add_article' => 'articles#new'
  post '/add_article' => 'articles#create'
  get '/show_article',  to: 'articles#show'
  post '/show_article',  to: 'articles#show'
  get '/by_category',  to: 'categories#show'
end

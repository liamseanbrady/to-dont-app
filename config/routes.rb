ToDontApp::Application.routes.draw do
  root 'users#index'

  get '/register', to: 'users#new', as: 'register'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout', as: 'logout'

  # How to does Rails cancel out users/new so users/:id doesn't pick it up? Figure and include in README

  get '/users', to: 'users#index', as: 'users'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#show', as: 'user'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/users/:id/todonts', to: 'todonts#index', as: 'user_todonts'
  post '/users/:id/todonts', to: 'todonts#create'
  get '/users/:user/todonts/:id', to: 'todonts#show', as: 'user_todont'

  post '/users/:user/todonts/:id/progress_log', to: 'todonts#progress_log', as: 'user_todont_progress_logs'
end

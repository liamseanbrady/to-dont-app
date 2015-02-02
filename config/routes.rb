ToDontApp::Application.routes.draw do
  root 'users#index'

  get 'register', to: 'users#new', as: 'register'

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id', to: 'users#show', as: 'user'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
end

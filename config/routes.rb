ToDontApp::Application.routes.draw do
  root 'users#index'

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id', to: 'users#show'
  put '/users/:id', to: 'users#update'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'users#home'

  get '/events', to: 'events#index'

  get '/login', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :events
  resources :users
  resources :registrations

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages
end

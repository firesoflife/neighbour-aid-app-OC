Rails.application.routes.draw do
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get 'logged_in', to: 'session#is_logged_in?'

  resources :user, only: [:create, :show, :index]

end

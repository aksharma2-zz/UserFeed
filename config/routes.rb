Rails.application.routes.draw do
  
   get '/', to: 'users#index'

   get '/user/new', to: 'users#newUser'

  # <http-request-type> <url>, to: '<controller-name>#<method-in-controller>'

  post '/user/create', to: 'users#create'

  delete '/user/delete', to: 'users#delete'

  delete '/post/delete', to: 'posts#delete'

  post '/user/edit', to: 'users#handleEdit'

  post '/user/new', to: 'users#create'

  resources :users

end

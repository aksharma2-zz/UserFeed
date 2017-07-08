Rails.application.routes.draw do  

  get '/', to: 'users#index'

  get '/user/new', to: 'users#newUser'


  # <http-request-type> <url>, to: '<controller-name>#<method-in-controller>'
  	

  get 'user/show', to: 'users#show'

  get  '/signup',  to: 'users#new'

  post '/user/create', to: 'users#create'

  delete '/user/delete', to: 'users#delete'

  delete '/post/delete', to: 'posts#delete'

  post '/user/edit', to: 'users#handleEdit'

  post '/user/new', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post '/session/new', to: 'sessions#login'

  resources :users

  resources :posts, only: [:create, :destroy, :index]

end

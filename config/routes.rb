Rails.application.routes.draw do
  
   get '/', to: 'users#index'

  # <http-request-type> <url>, to: '<controller-name>#<method-in-controller>'

  post '/user/create', to: 'users#create'

  delete '/user/delete', to: 'users#delete'

  delete '/post/delete', to: 'posts#delete'

end

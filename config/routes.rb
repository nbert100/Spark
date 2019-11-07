Rails.application.routes.draw do
 
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #get '/users/:id', to: 'users#show', as: 'user'
  #resources :users

  get '/auth/facebook/callback' => 'sessions#fbcreate'
   
  resources :meetings

  resources :suitors do
    resources :meetings, only: [:new, :show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :suitors, only:[:show] is the same as get 'pets/:id' => 'pets#show'
end

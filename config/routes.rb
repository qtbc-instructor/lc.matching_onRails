Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'login#index'
  resources :users, only:[:new,:create]

  post 'users/confirm'

  get '/lecturer' => 'lecturer#index'
  post '/lecturer/update' => 'lecturer#update'

  get 'users/view'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'

  post '/logout', controller: 'login', action: 'logout'

  # resources :companies
  get '/company', controller: 'company', action: 'index'
  get '/company/search', controller: 'company', action: 'search'
  post '/company/search', controller: 'company', action: 'search'
  post '/company/result', controller: 'company', action: 'result'
  get '/company/result', controller: 'company', action: 'result'
  delete '/company/destroy/:id', controller: 'company', action: 'destroy'
  post '/company/', controller: 'company', action: 'update'
  post '/company/:id', controller: 'company', action: 'update2'


  #resources :lecturer

  get 'lecturer/index'
  post 'lecturer/update'

  #LECTURER ROUTES
  post 'lecturer/newfreeday' => 'lecturer#create_free'
  post 'lecturer/addskill' => 'lecturer#add_skill'
  post 'lecturer/deletefree' => 'lecturer#delete_free'
  post'lecturer/deleteskill' => 'lecturer#delete_skill'

end

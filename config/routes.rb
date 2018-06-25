Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'login#index'
  resources :users, only:[:new,:create]

  post 'users/confirm'

  get '/lecturer' => 'lecturer#index'

  get 'users/view'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'


  # resources :companies
  get '/company', controller: 'company', action: 'index'
  get '/company/search', controller: 'company', action: 'search'
  post '/company/search', controller: 'company', action: 'search'
  post '/company/result', controller: 'company', action: 'result'
  get '/company/result', controller: 'company', action: 'result'
  delete '/company/destroy/:id', controller: 'company', action: 'destroy'
  post '/company/', controller: 'company', action: 'update'


  #resources :lecturer

  get 'lecturer/index'

  #LECTURER ROUTES
  post 'lecturer/newfreeday' => 'lecturer#create_free'
  post 'lecturer/addskill' => 'lecturer#add_skill'
  post 'lecturer/deletefree' => 'lecturer#delete_free'
  post'lecturer/deleteskill' => 'lecturer#delete_skill'

end

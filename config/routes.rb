Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'login#index'

  resources :users

  post 'users/confirm'

  get '/lecturer' => 'lecturer#index'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'

  get 'lecturer/index'

  get '/company', controller: 'company', action: 'index'
  get '/company/search', controller: 'company', action: 'search'
  post '/company/search', controller: 'company', action: 'search'
  post '/company/result', controller: 'company', action: 'result'




  #resources :lecturer

  get 'lecturer/index'
  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'
  post 'lecturer/newfreeday' => 'lecturer#create_free'
  post 'lecturer/addskill' => 'lecturer#add_skill'
  post 'lecturer/deletefree' => 'lecturer#delete_free'
  post'lecturer/deleteskill' => 'lecturer#delete_skill'


end

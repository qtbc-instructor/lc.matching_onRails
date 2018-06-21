Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #resources :users

  get 'users/view'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'

  #resources :companies
  get '/company', controller: 'company', action: 'index'
  delete '/company/destroy/:id', controller: 'company', action: 'destroy'
  put '/company/update', controller: 'company', action: 'update'
  get '/company/search',controller: 'company', action: 'search'

  #resources :lecturer

  get 'lecturer/index'

  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'

end

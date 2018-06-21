Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #resources :users

  get 'users/view'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get '/company', controller: 'company', action: 'index'
  get '/company/search', controller: 'company', action: 'search'
  post '/company/search', controller: 'company', action: 'search'
  post '/company/result', controller: 'company', action: 'result'




  #resources :lecturer

  get 'lecturer/index'
<<<<<<< HEAD
  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'


=======
>>>>>>> origin/company
end

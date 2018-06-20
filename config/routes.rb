Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root 'users#index' 
  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'
  post 'check' => 'users#check'
  
  # root to: 'login#index'

  get 'users/view'

  get '/company' => 'company#index'
  get '/lecturer' => 'lecturer#index'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get '/company', controller: 'company', action: 'index'
  get 'lecturer/index'
=======

  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'

>>>>>>> 93f3a309c1a47ddecefde87adc88b61c8de69680

end

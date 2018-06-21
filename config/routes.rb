Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'login#index'

  resources :users

  post 'users/confirm'

  get '/company' => 'company#index'
  get '/lecturer' => 'lecturer#index'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'
#  get '/company', controller: 'company', action: 'index'

  get 'lecturer/index'
end

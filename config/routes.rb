Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :users

  get 'users/view'

  get 'login/index'
  post 'login/auth'
  get 'login/logout'

  #resources :lecturer

  get 'lecturer/index'
end

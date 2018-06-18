Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/company', controller: 'company', action: 'index'

  #resources :lecturer

  get 'lecturer/index'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/company', controller: 'company', action: 'index'
  get '/company/search', controller: 'company', action: 'search'
  post '/company/search', controller: 'company', action: 'search'



  #resources :lecturer

  get 'lecturer/index'
end

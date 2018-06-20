Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #LECTURER ROUTES
  get 'lecturer/:id' => 'lecturer#index'
  post 'lecturer/newfreeday' => 'lecturer#createfree'
  post 'lecturer/addskill' => 'lecturer#addskill'
  get 'lecturer/deletefree'
  get 'lecturer/deleteskill'

end

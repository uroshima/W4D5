Rails.application.routes.draw do
  get 'goals/new'

  get 'goals/create'

  get 'goals/show'

  get 'goals/update'

  get 'goals/destroy'

  get 'goals/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end

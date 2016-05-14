Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get   'signup'  =>  'users#new'

  get   'signin'  =>  'auth#new'
  post  'signin'  =>  'auth#create'

  get   'signin/:token'   =>  'auth#update'
  get   'signout'         =>  'auth#destroy'

  post  'users'   =>  'users#create'
end

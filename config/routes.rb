Rails.application.routes.draw do
  devise_for :users
  resources :users,:masters,:categories,:offers,:clients,:visits
  get 'pages/home'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'destroy_all' => 'users#destroy_all', as: :destroy_all
  post 'create_by_owner' => 'users#create_by_owner', as: :create_by_owner

end

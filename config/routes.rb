Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'pages/home'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'users/manager_edit_multiple'
  get 'users/create_by_owner'
  post 'create_by_owner' => 'users#create_by_owner', as: :create_by_owner

end

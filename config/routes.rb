Rails.application.routes.draw do
  devise_for :users
  resources :users,:masters,:categories,:offers,:clients,:visits,:day_of_weeks,:working_hours,:bookings
  get 'pages/home'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'destroy_all' => 'users#destroy_all', as: :destroy_all
  get 'destroy_all_masters' => 'masters#destroy_all_masters', as: :destroy_all_masters
  get 'destroy_all_offers' => 'offers#destroy_all_offers', as: :destroy_all_offers
  get 'destroy_all_visits' => 'visits#destroy_all_visits', as: :destroy_all_visits
  get 'destroy_all_clients' => 'clients#destroy_all_clients', as: :destroy_all_clients
  post 'create_by_owner' => 'users#create_by_owner', as: :create_by_owner

end

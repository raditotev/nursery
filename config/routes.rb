Rails.application.routes.draw do
  resources :breaks
  resources :testemonials
  resources :awards
  resources :newsletters
  devise_for :parents
  resources :parents
  get 'admin_pages/dashboard'

  devise_for :admins
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

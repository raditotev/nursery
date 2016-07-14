Rails.application.routes.draw do
  resources :newsletters
  devise_for :parents
  resources :parents
  get 'admin_pages/dashboard'

  devise_for :admins
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

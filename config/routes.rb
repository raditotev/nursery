Rails.application.routes.draw do
  resources :faqs
  resources :jobs
  resources :breaks
  resources :testemonials
  resources :awards
  resources :newsletters
  devise_for :parents, only: [:sessions, :passwords]
  resources :parents
  get 'admin' => 'admin_pages#dashboard'
  get 'admin/awards' => 'admin_pages#awards'


  devise_for :admins, only: [:sessions, :passwords]
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

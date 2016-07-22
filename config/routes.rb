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
  get 'admin/faqs' => 'admin_pages#faqs'
  get 'admin/breaks' => 'admin_pages#breaks'
  get 'admin/jobs' => 'admin_pages#jobs'

  devise_for :admins, only: [:sessions, :passwords]
  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

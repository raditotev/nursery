Rails.application.routes.draw do
  resources :faqs, except: :index
  resources :jobs, except: :index
  resources :breaks, except: :index
  resources :testemonials, except: :index
  resources :awards, except: :index
  resources :newsletters, except: :index
  devise_for :parents, only: [:sessions, :passwords]
  resources :parents, except: :index
  get 'admin' => 'admin_pages#dashboard'
  get 'admin/awards' => 'awards#index'
  get 'admin/faqs' => 'faqs#index'
  get 'admin/breaks' => 'breaks#index'
  get 'admin/jobs' => 'jobs#index'
  get 'admin/newsletters' => 'newsletters#index'
  get 'admin/parents' => 'parents#index'
  get 'admin/testemonials' => 'testemonials#index'
  get 'admin/admins' => 'admins#index'

  devise_for :admins, only: [:sessions, :passwords]
  resources :admins, except: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

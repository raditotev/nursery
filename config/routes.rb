Rails.application.routes.draw do
  root to: 'public_pages#home'

  resources :albums, except: :index
  resources :faqs, except: :index
  resources :jobs, except: :index
  resources :events, except: :index
  resources :photos
  resources :testemonials, except: :index
  resources :awards, except: :index
  resources :newsletters, except: :index
  devise_for :parents, only: [:sessions, :passwords]
  resources :parents, except: :index
  devise_for :admins, only: [:sessions, :passwords]
  resources :admins, except: :index

  # Administration routes
  get 'admin' => 'admin_pages#dashboard', as: :admin_dashboard
  get 'admin/awards' => 'awards#index'
  get 'admin/faqs' => 'faqs#index'
  get 'admin/albums' => 'albums#index'
  get 'admin/events' => 'events#index'
  get 'admin/jobs' => 'jobs#index'
  get 'admin/newsletters' => 'newsletters#index'
  get 'admin/parents' => 'parents#index'
  get 'admin/testemonials' => 'testemonials#index'
  get 'admin/admins' => 'admins#index'

  # Public routes
  get 'about-us' => 'public_pages#about_us'
  get 'nursery' => 'public_pages#nursery'
  get 'staff' => 'public_pages#staff'
  get 'contact' => 'public_pages#contact'
  post 'contact' => 'public_pages#contact'
  get 'newsletters' => 'public_pages#newsletters'
  get 'careers' => 'public_pages#careers'
  get 'testimonials' => 'public_pages#testimonials'
  get 'education_fund' => 'public_pages#education_fund'
  get 'eyfs_curriculum' => 'public_pages#eyfs_curriculum'
  get 'british_values' => 'public_pages#british_values'
  get 'save_money' => 'public_pages#save_money'
  get 'faqs' => 'public_pages#faqs'
  get 'gallery' => 'public_pages#gallery'
  get 'profile' => 'public_pages#profile'

  get 'download_fees_terms_and_conditions' => 'application#fees_terms_and_conditions'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

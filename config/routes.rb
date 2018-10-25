Rails.application.routes.draw do
  devise_for :users

  get  'home',           to: 'static_pages#home'
  get  'dashboard',      to: 'static_pages#dashboard'
  get  'cafeteria',      to: 'cafeteria#index'
  post 'purchase_snack', to: 'cafeteria#purchase_snack'
  get  'gym',            to: 'gym#index'
  post 'train',          to: 'gym#train'
  get  'jobs',           to: 'jobs#index'
  post 'work',           to: 'jobs#work'

  resources :characters

  devise_scope :user do
    authenticated :user do
      root to: 'static_pages#dashboard', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'static_pages#home', as: :unauthenticated_root
    end
  end
end

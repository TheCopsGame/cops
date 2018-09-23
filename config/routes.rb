Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'static_pages#home'
  get 'dashboard', to: 'static_pages#dashboard'

  devise_scope :user do
    authenticated :user do
      root to: 'static_pages#dashboard', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'static_pages#home', as: :unauthenticated_root
    end
  end
end

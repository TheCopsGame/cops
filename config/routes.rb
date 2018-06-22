Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'static_pages#home'
  root to: 'static_pages#home'
end

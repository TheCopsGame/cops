Rails.application.routes.draw do
  get 'home', to: 'static_pages#home'
  root to: 'static_pages#home'
end

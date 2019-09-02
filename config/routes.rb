Rails.application.routes.draw do
  resources :articles
  devise_for :users
  root 'static_pages#index'
  resources :articles
  get 'resume', to: 'static_pages#resume'
  get 'about', to: 'static_pages#about'
end


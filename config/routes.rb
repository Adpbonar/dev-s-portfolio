Rails.application.routes.draw do
  resources :code_samples
  resources :projects
  resources :articles
  devise_for :users
  root 'static_pages#index'
  get 'contact_me', to: 'static_pages#contact_me'
  get 'about', to: 'static_pages#about'
  get 'more_code', to: 'static_pages#more_code'
  get 'more_apps', to: 'static_pages#more_projects'
end


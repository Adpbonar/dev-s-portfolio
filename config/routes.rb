Rails.application.routes.draw do
  resources :index_documents, only: [:new, :create, :index, :edit, :update]
  resources :about_documents, only: [:new, :create, :index, :edit, :update]
  resources :code_samples
  resources :projects
  resources :articles
  devise_for :users
  root 'static_pages#index'
  get 'contact_me', to: 'static_pages#contact_me'
  get 'about', to: 'static_pages#about'
end


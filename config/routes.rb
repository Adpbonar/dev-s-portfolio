Rails.application.routes.draw do
  
  root 'static_pages#index'

  devise_for :users

  resources :articlesend
  resources :index_documents, only: [:index, :edit, :update]
  resources :about_documents, only: [:index, :edit, :update]
  resources :code_samples
  resources :projects
 
  resources :articles do
    resources :comments
  end
  
  get 'contact_me', to: 'static_pages#contact_me'
  get 'about', to: 'static_pages#about'
end


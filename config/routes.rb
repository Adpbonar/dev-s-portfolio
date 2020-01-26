match "*path" => redirect("https://www.devanpotterbonar.com/%{path}"), :constraints => { :protocol => "http://" }
match "*path" => redirect("https://www.devanpotterbonar.com/%{path}"), :constraints => { :subdomain => "" }
Rails.application.routes.draw do
  resources :articlesend
  resources :index_documents, only: [:index, :edit, :update]
  resources :about_documents, only: [:index, :edit, :update]
  resources :code_samples
  resources :projects
  resources :articles
  devise_for :users
  root 'static_pages#index'
  get 'contact_me', to: 'static_pages#contact_me'
  get 'about', to: 'static_pages#about'
end


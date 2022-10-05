Rails.application.routes.draw do
  root to: 'about#index'
  get "about/index"
  get 'categories/index'
  get 'categories/show'
  get 'dishes/index'
  get 'dishes/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dishes
  resources :categories
end

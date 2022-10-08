Rails.application.routes.draw do
  root to: 'about#index'
  get 'about/index'
  get 'categories/index'
  get 'categories/show'
  get 'dishes/index'
  get 'dishes/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :dishes do
    # dishes/search/(:format)
    collection do
      get 'search'
    end
  end

  resources :categories do
    # dishes/search/(:format)
    collection do
      get 'search'
    end
  end
  # resources :category_id
end

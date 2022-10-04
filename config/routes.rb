Rails.application.routes.draw do
<<<<<<< HEAD
  get 'dishes/index'
  get 'dishes/show'
=======
  get 'dish/index'
  get 'dish/show'
>>>>>>> 66721e05cca8990b49edfc740cab96a72c36675a
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dishes
end

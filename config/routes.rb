Rails.application.routes.draw do
  resources :articles, only: %w[index create]
  namespace :api do
    resources :articles, only: %[index create]
    # resources
  end

  root 'site#index'
  # get '/*path' => 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  namespace :api do
    # resources
  end

  root 'site#index'
  get '/*path' => 'site#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

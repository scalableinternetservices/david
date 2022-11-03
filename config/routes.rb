Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: %w[index create]
  end

  resources :articles, only: %w[index create]

  get '/react' => 'site#index'
end

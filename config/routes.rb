Rails.application.routes.draw do
  resources :sessions
  resources :exercises
  resources :workouts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :workouts do
    get '/page/:page', action: :index, on: :collection
  end
  root "workouts#index"
  get 'about', to: 'about#show'
end

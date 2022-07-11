Rails.application.routes.draw do
  get 'sessions/show'
  get 'welcome/index'
  resources :consultations
  # sends a get request to the show method in the sessions controller
  get '/sessions', to: 'sessions#show'
  # sends a post request to the show method in the sessions controller with a parameter passed from the view
  post '/sessions', to: 'sessions#show', as: :sessions_show
  # sends the root to the landig page
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

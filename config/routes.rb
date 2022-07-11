Rails.application.routes.draw do
  get 'sessions/show'
  get 'welcome/index'
  resources :consultations
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

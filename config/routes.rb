Rails.application.routes.draw do
  get 'resumes/index'
  get 'resumes/new'
  get 'resumes/create'
  get 'resumes/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'user/create'
  get 'user/new'
  get 'user/index'
  get "/create",to:"books#create"
  get '/signup' => 'user#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :customers
  get "/new",to:"customers#new"
  get "/first",to:"customers#first"
  resources :sports
  resources :books
  root "user#index"
  get "/mains", to:"mains#application"
  get "/books",to:"books#index"
  post '/users' => 'user#create'
  get "/sports",to:"sports#index"
  get '/' => 'user#index'
  get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'
resources :resumes, only: [:index, :new, :create, :destroy]
get "/resume",to:"resumes#resume"
get "/new",to:"resumes#new"
end

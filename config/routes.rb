Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#index'

  resources :notes do
    get "search", on: :collection
  end

  get "welcome/hello/(:message)", to: "welcome#hello", as: :hello_welcome
  get "welcome/goodbye", to: "welcome#goodbye", as: :goodbye_welcome
end
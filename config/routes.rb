Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'notes#index'

  get "notes", to: "notes#index", as: :notes
  get "notes/new", to: "notes#new", as: :new_note
  post "notes", to: "notes#create"
  get "notes/:id", to: "notes#show", as: :note
  delete "notes/:id", to: "notes#destroy"

  get "welcome/hello/(:message)", to: "welcome#hello", as: :hello_welcome
  get "welcome/goodbye", to: "welcome#goodbye", as: :goodbye_welcome
end
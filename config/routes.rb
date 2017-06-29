Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#hello'
  get "welcome/hello/:message", to: "welcome#hello", as: :hello_welcome
  get "welcome/goodbye", to: "welcome#goodbye", as: :goodbye_welcome
end

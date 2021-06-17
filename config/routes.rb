Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/user/:id" => "users#show"
  get "users" => "users"
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

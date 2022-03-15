Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: %i[new create show] do
    get "join", on: :member
    get "votes/new", on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

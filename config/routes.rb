Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Change this later
  get "events/:id/join", to: "events#join", as: :short_join_event

  resources :events, only: %i[new create show] do
    resources :attendees, only: [:create]
    get "join", on: :member

    resources :votes, only: %i[new create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Change this later
  get "e/:funid", to: "events#join", as: :short_join_event

  resources :events, only: %i[new create index show] do
    resources :attendees, only: [:create]
    get "join", on: :member

    resources :date_votes, only: %i[new create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

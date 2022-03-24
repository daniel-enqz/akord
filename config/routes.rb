Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Change this later
  get "e/:funid", to: "events#join", as: :short_join_event
  get "e", to: "events#join", as: :pin_join_event # GET e?
  get "join", to: "pages#join"

  resources :events, only: %i[new create index show] do
    resource :chosen_date, only: %i[create show]
    resources :attendees, only: [:create]
    get "join", on: :member

    resources :date_votes, only: %i[new create]
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

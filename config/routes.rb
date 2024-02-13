Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "decks#index"
  resources :decks do
    resources :cards do 
      get 'next', on: :member
      patch 'set_reviewed', on: :member
    end
    get 'new_card', on: :member
    get 'done', on: :member
    get 'study', on: :member
    get 'reset', on: :member
  end
end

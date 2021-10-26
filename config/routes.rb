Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :venues
      #post "events/cancel", to: "events#cancel"
      resources :events do
        resources :tickets
      end
      #resource :users, only: [:create]
      resources :users
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
    end
  end
end

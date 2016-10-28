Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :words, only: [:index]
      get "/sentence", to: "sentence#index"
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients
      resources :cocktails

      post '/login', to: 'auth#create'
      get '/me', to: 'auth#show'
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  post "/graphql", to: "graphql#execute"
  
  namespace :api do
    scope module: 'v1', path: 'v1' do
      resources :direct_uploads, only: [:create]
    end
  end
end

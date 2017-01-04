Rails.application.routes.draw do
  get '/session', to: 'sessions#get'
  delete '/session', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :organizations, only: [:index] do
    resources :projects, only: [:index, :create, :update, :show]
  end
end

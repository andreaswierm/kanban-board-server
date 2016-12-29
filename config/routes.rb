Rails.application.routes.draw do
  get '/session', to: 'sessions#get'
  delete '/session', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#create'
end

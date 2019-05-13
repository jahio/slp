Rails.application.routes.draw do
  get '/tags/:hashtag', to: 'assets#by_tag'
  resources :assets
  root to: 'assets#index'
end

Rails.application.routes.draw do
  root to: 'urls#new'
  post '/shorten', to: 'urls#create'
  get '/:shortly_url', to: 'urls#redirect', as: 'redirect'
end

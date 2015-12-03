Rails.application.routes.draw do
  root to: 'urls#new'
  post '/shorten', to: "urls#create"
end

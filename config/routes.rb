Rails.application.routes.draw do
  root "tops#index"

  post '/chat', to: 'chat#create'
end

Rails.application.routes.draw do
  root "tops#index"

  namespace :api do
    namespace :v1 do
      namespace :web do
        post :home, to: 'home#create'
        post 'auth/:provider/callback', to: 'users#create', as: 'auth_callback'
      end
    end
  end
end

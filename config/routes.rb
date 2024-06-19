Rails.application.routes.draw do
  root "tops#index"

  namespace :api do
    namespace :v1 do
      namespace :web do
        post :home, to: 'home#create'
      end
    end
  end
end

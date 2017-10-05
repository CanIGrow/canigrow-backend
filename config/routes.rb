Rails.application.routes.draw do
  resource :session, only: :create
  resources :users do
    collection do
      post :login
    end
  end
end

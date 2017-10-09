Rails.application.routes.draw do
  scope '/api' do
    resources :plants do
      post :favorite
    end
    resources :users do
      resources :plots
      collection do
        post :login
      end
    end
    resources :zones do
      collection do
        post :get_zone
      end
    end
  end
end

Rails.application.routes.draw do
  scope '/api' do
    resources :plants
    resources :users do
      collection do
        post :login
      end
    end
  end
end

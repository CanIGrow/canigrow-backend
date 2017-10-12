Rails.application.routes.draw do
  scope '/api' do
    resources :plants, only: [:index, :show] do
      post :favorite
    end
    resources :users, only: [:create, :index, :show, :update, :destroy] do
      collection do
        post :login
      end
    end
    resources :plots, only: [:create, :show, :update, :destroy] do
      patch :rename 
    end

  end
end

# , only: [:index, :new, :create, :show, :edit, :update, :destroy]
# , shallow: true do

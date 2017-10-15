Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  scope '/api' do
    resources :plants, only: [:index, :show] do
      post :favorite
    end
    resources :users, param: :username, only: [:show, :create, :index, :show, :update, :destroy] do
      collection do
        post :login
      end
    end
    resources :plots, only: [:create, :show, :update, :destroy] do
      patch :rename
    end
    resources :account_activations, only: [:edit]

  end
end

# , only: [:index, :new, :create, :show, :edit, :update, :destroy]
# , shallow: true do

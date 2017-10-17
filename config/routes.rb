Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"

  get 'password_resets/new'
  get 'password_resets/edit'
  post 'account_activations/activate'
  resources :account_activations, only: [:edit, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  scope '/api' do
    resources :plants, only: [:index, :show] do
      post :favorite
      resources :comments, only: [:create, :destroy]
    end
    resources :users, param: :username, only: [:show, :create, :index, :show, :update, :destroy] do
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

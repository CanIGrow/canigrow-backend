Rails.application.routes.draw do
  resource :session, only: :create
end

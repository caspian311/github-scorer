Rails.application.routes.draw do
  namespace :api do
    resource :scores, only: :show
  end

  root :to => 'home#index'
end

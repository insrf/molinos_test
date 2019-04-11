Rails.application.routes.draw do

  devise_for :admins
  root "categories#index"

  devise_for :users

  resources :categories, only: %i[index show ] do
    resources :products, only: :show
  end



  namespace :admin do
    resources :categories, shallow: true do
      collection do
        post :sort
      end
      resources :products, shallow: true
    end
  end
end

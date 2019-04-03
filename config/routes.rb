Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :categories, shallow: true do
    collection { post :sort }
    resources :products, shallow: true
  end
end

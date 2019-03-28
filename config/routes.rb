Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :categories, shallow: true do
    resources :products, shallow: true
  end
end

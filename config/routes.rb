Rails.application.routes.draw do
  resources :derivatives
  resources :models
  resources :model_ranges
  resources :manufacturers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

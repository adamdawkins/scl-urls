Rails.application.routes.draw do
  resources :manufacturers, path: 'car-leasing' do
    resources :model_ranges do 
      resources :models do 
        resources :derivatives, only: :index
      end
    end
  end
  resources :model_ranges
  resources :models
  resources :derivatives
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

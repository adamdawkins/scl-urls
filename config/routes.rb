Rails.application.routes.draw do
  get '/:channel_id/:manufacturer_id/:model_range_id/:model_id/:id', to: 'derivates#show'
  get '/:channel_id/:manufacturer_id/:model_range_id/:id', to: 'models#show'
  get '/:channel_id/:manufacturer_id/:id', to: 'model_ranges#show'
  get '/:channel_id/:manufacturer_id', to: 'manufacturers#show'
  get '/:id', to: 'channels#show'

  root controller: "channel", action: "show", params: { id: "car-leasing" }

  # resources :manufacturers, path: 'car-leasing' do
  #   resources :model_ranges do 
  #     resources :models do 
  #       resources :derivatives, only: :index
  #     end
  #   end
  # end
  # resources :model_ranges
  # resources :models
  # resources :derivatives
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

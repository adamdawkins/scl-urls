Rails.application.routes.draw do
  get '/:channel_id/:manufacturer_id/:model_range_id/:model_id/:id', to: 'derivatives#show',  as: :derivative
  get '/:channel_id/:manufacturer_id/:model_range_id/:id', to: 'models#show', as: :model
  get '/:channel_id/:manufacturer_id/:id', to: 'model_ranges#show', as: :model_range
  get '/:channel_id/:id', to: 'manufacturers#show', as: :manufacturer
  get '/:id', to: 'channels#show', as: :channel

  root to: 'channels#show'

  # resources :model_ranges
  # resources :models
  # resources :derivatives
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

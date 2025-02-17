Rails.application.routes.draw do
  resources :certificate_subgroups
  resources :certificates
  get '/health', to: 'health#show'
  root 'health#show'

  namespace :api do
    namespace :v1 do
      resource :session
      resource :registration, only: %i[new create]
      resources :passwords, param: :token
      resources :brands
      resources :cert_types
      resources :subgroups
      resources :product_groups
      resources :certificates
    end
  end
end

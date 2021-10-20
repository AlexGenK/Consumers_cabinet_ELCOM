Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  namespace :admin do
    resource :purveyor, controller: 'purveyor', only: [:edit, :update]
    resources :ftp_profiles

    get 'filling_consumers',  to: 'filling_consumers#set_params'
    post 'filling_consumers', to: 'filling_consumers#start'

    get 'filling_consumptions',  to: 'filling_consumptions#set_params'
    post 'filling_consumptions', to: 'filling_consumptions#start'

    get 'filling_distributions',  to: 'filling_distributions#set_params'
    post 'filling_distributions', to: 'filling_distributions#start'

    get 'filling_ccertificates',  to: 'filling_ccertificates#set_params'
    post 'filling_ccertificates',  to: 'filling_ccertificates#start'

    get 'filling_dcertificates', to: 'filling_dcertificates#set_params'
    post 'filling_dcertificates', to: 'filling_dcertificates#start'
  end

  resources :consumers do
    resources :payments
    resources :consumptions do
      post 'selector', on: :collection
    end
    resources :distributions do
      post 'selector', on: :collection
    end
    get 'client_changed', to: 'consumers#client_changed'
    get 'purveyor', to: 'admin/purveyor#show'
    get 'annual_consumptions', to: 'annual_consumptions#show' 
  end

  resources :users
  
  root to: 'consumers#index'
end

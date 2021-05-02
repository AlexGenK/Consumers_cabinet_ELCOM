Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resource :purveyor, controller: 'purveyor', only: [:edit, :update]

    get 'filling_consumers',  to: 'filling_consumers#set_params'
    post 'filling_consumers', to: 'filling_consumers#start'

    get 'filling_consumptions',  to: 'filling_consumptions#set_params'
    post 'filling_consumptions', to: 'filling_consumptions#start'

    get 'filling_distributions',  to: 'filling_distributions#set_params'
    post 'filling_distributions', to: 'filling_distributions#start'
  end

  resources :consumers do
    resources :payments
    resources :consumptions do
      post 'selector', on: :collection
    end
    resources :distributions do
      post 'selector', on: :collection
    end
    get 'purveyor', to: 'admin/purveyor#show'
  end
  
  root to: 'consumers#index'
end

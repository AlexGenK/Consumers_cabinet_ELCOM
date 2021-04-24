Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resource :purveyor, controller: 'purveyor', only: [:edit, :update]

  	get 'filling_consumers',  to: 'filling_consumers#set_params'
    post 'filling_consumers', to: 'filling_consumers#start'
  end

  resources :consumers do
  	resources :payments

  	get 'purveyor', to: 'admin/purveyor#show'
  end
  
  root to: 'consumers#index'
end

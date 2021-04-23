Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resource :purveyor, controller: 'purveyor', only: [:edit, :update]
  end

  resources :consumers do
  	get 'purveyor', to: 'admin/purveyor#show'
  end
  
  root to: 'consumers#index'
end

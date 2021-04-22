Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  	resource :purveyor, controller: 'purveyor', only: [:edit, :update]
  end

  resources :consumers
  
  root to: 'consumers#index'
end

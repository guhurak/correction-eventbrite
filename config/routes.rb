Rails.application.routes.draw do
  root "events#index"
  devise_for :users
  resources :users
  resources :events do
		resources :charges
  	resources :attendances
  end
end

Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard/prices'
  post '/dashboard/prices', to: 'dashboard#prices'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

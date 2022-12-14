Rails.application.routes.draw do
  devise_for :users
  root 'homepages#index'
  resources :admins
  resources :hr
  resources :employees
  namespace :api do
    namespace :v1,defaults: { format: :json } do
      resources :admins,:employees,:hr
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

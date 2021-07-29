Rails.application.routes.draw do
  devise_for :users
  
  root to: 'company_sales#index'

  resources :company_sales do
    collection { post :import }
  end

  resources :merchants

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

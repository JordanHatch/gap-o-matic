Rails.application.routes.draw do

  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  get 'sign-in' => 'sessions#new', as: :new_session
  get 'sign-out' => 'sessions#destroy', as: :destroy_session

  resources :dashboards do
    resources :entries
  end

  root to: 'dashboards#index'

end

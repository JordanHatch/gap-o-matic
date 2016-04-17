Rails.application.routes.draw do

  get 'entries/new'

  get 'entries/edit'

  resources :dashboards do
    resources :entries
  end

  root to: 'dashboards#index'

end

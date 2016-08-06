Rails.application.routes.draw do

  devise_for :users, only: :session, path: 'session',
      path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users, only: [:show]

  resources :events do
    get :report, on: :collection
  end
  resources :event_types


  root to: 'visitors#index'
end
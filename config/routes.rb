Rails.application.routes.draw do

  root "quotes#index"

  resources :quotes
  resources :users, except: [:index, :show]
  resources :sessions, only: [:new, :create] do

    delete :destroy, on: :collection
  end

end

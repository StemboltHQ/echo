Rails.application.routes.draw do

  root "quotes#index"

  resources :quotes do
    resources :votes, only: [:create, :update, :destroy]
  end
  resources :users, except: [:index, :show]
  resources :sessions, only: [:new, :create] do

    delete :destroy, on: :collection
  end

end

Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :types, only: [:index, :show] do
      resources :products
    end
  end

  resources :categories, only: [:index, :show] do
    resources :designers, only: [:index, :show] do
      resources :types, only: [:index, :show] do
        resources :products
      end
    end
  end

  resources :users do
    resources :carts, only: [:show, :update, :destroy]
  end
  

  resources :categories, :designers, :types, :products

  post "/login", to: "sessions#create"














  # resources :categories  do
  #   resources :types , shallow: true
  # end
  # resources :types do
  #   resources :products , shallow: true
  # end
  # resources :categories  do
  #     resources :designers , shallow: true
  # end
  # resources :designers do
  #     resources :types , shallow: true
  # end

  # resources :types do 
  #     resources :products , shallow: true
  #   end

  # get "/categories", to: "categories#index"

end

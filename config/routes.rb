Rails.application.routes.draw do
  root to: "pages#index"
  get "/bohconf", to: "pages#bohconf"
  get "/ignite", to: "pages#ignite"
  get "/talk", to: "pages#talk"
  get "/stay", to: "pages#stay"
  get "/5k", to: "pages#fivek", as: "fivek"
  get "/happy", to: "pages#happy"
  get "/kids", to: "pages#kids"
  get "/sponsor", to: "pages#sponsor"
  get "/sponsors", to: "pages#sponsor"
  get "/usergroups", to: "pages#usergroups"

# all your other routes
  get '*unmatched', to: 'application#not_found_method', via: :all

  resources :favorites do
    collection do
      get "thanks"
    end
  end

  resources :guests do
    collection do
      get "thanks"
    end
  end

  resources :hosts do
    collection do
      get "thanks"
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

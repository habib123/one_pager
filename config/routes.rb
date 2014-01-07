OnePagerApp::Application.routes.draw do
  
 
  resources :one_pagers

  get "search/search"
  get "search/search_result"

  # Moinul backup-2-12-2013 
  #resources :users
  #match '/signup',  to: 'users#new',  via: 'get'
  #match '/signin',  to: 'users#index',  via: 'get'
  
  # Moinul added user controller related route -2-12-2013
  get 'users/start'
  get 'users/register'
  get 'users/registered'
  get 'users/profile'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',     via: 'get'
  match '/signup',  to: 'users#register',   via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  # Habib added mig_users controller related route 
  resources :mig_users
  resources :mig_sessions, only: [:new, :create, :destroy]
  match '/mig_signup',  to: 'mig_users#new', via: 'get'
 

  # Habib added Mig_Sessions controller related route
  resources :mig_sessions, only: [:new, :create, :destroy]
  match '/mig_signin',  to: 'mig_sessions#new',         via: 'get'
  match '/mig_signout', to: 'mig_sessions#destroy',     via: 'delete'
  match '/one_pager_approve',  to: 'one_pagers#one_pager_approve',  via: 'get'
  match '/mig_message/:id',  to: 'one_pagers#mig_message',  via: 'get'

  
  # Moinul added APItest controller related route -27-11-2013
  resources :apitest
  post 'apitest/patent', to: 'apitest#patent'
  post 'apitest/applicant', to: 'apitest#applicant'
  post 'apitest/portfolio', to: 'apitest#portfolio'
  post 'apitest/bulk', to: 'apitest#bulk'

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

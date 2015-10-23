Cmms::Application.routes.draw do
  get 'control_panel/index'

  resources :roles

  resources :categories

  resources :facilities

  devise_for :users
  scope "/admin" do
    resources :users
    
    get 'control_panel', controller: 'control_panel', action: :index
  end
  
  get 'reports/by_address', controller: 'reports', action: :by_address

  get 'reports/by_status', controller: 'reports', action: :by_status

  get 'reports/by_category', controller: 'reports', action: :by_category
  
  get 'reports/closed_items', controller: 'reports', action: :closed_items
  
  get 'reports/closed_items_by_category', controller: 'reports', action: :closed_items_by_category
  
  get 'reports/closed_items_by_status', controller: 'reports', action: :closed_items_by_status
  
  get 'reports', controller: 'reports', action: :by_address
  
  get 'contact', controller: 'contact', action: :index

  resources :properties
  
  resources :service_requests

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  authenticated :user do
    root :to => 'service_requests#index', as: :authenticated_root
  end
  root :to => 'service_requests#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

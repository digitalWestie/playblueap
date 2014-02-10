Blueap::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => 'registrations' }

  get "admin/actions" => "moderate_actions#index", :as => :moderate_actions
  put "admin/actions" => "moderate_actions#update", :as => :moderate_actions
  
  get "admin/badges" => 'admin_badges#index', :as => :admin_badges
  get "admin/badges/new" => 'admin_badges#new', :as => :admin_new_badge
  match "admin/badges/new" => 'admin_badges#new', :as => :new_admin_badge
  post "admin/badges" => 'admin_badges#new', :as => :admin_badges
  delete "admin/badges/:id" => 'admin_badges#destroy', :as => :admin_badge

  get "admin" => "moderate_actions#index"
  get "actions" => "actions#index"
  get "totals" => "actions#totals"

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
  root :to => 'actions#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
Quicktag::Application.routes.draw do
  resources :quick_tags

  resources :tags

  resources :users
  
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
  root :to => "home#index"
  #match '/users' => 'home#users', :as => :users
  #match '/tags' => 'home#tags', :as => :tags	
  
  # Redirect for Provider (Twitter, Facebook, etc.) Oauth
  match "/auth/:provider/callback" => "sessions#create"
  
  # Provide sign out for Oauth
  match "/signout" => "sessions#destroy", :as => :signout
  
  # Provide route for submitting new tag via quick tag
  match "/new_quicktag" => "tags#quicktag"
  
  # Provide route for viewing tags for specific day
  match "/tags_day" => "tags#tagsday"
  
  # Provide route for viewing help page
  match "/help" => "help#index"
  
  # Provide route for viewing weeks
  match "/week" => "tags#week"
  
  # Provide route for admin pages
  match "/admin" => "admin#index"
  match "/admin/users" => "admin#users"
  match "/admin/tags" => "admin#tags"
  
  # Provide route for experiment pages
  match "/experiments" => "tags#experiments"
  match "/conduct" => "tags#conduct"
  
  # Resource for autocomplete
  resources :tags do
  	get :autocomplete_title, :on => :collection
  end
  
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

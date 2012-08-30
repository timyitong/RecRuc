Rec2::Application.routes.draw do
  



  resources :activity_refs

  resources :location_have_locations

  resources :activity_livereports

  resources :activity_comments

  resources :activity_tags

  resources :activity_user_actions do
    collection do
      get 'addAction'
    end
  end

  resources :tags do
    collection do
      get 'select'
      get 'search'
      get 'quickcreate'
      get 'hot_list'
    end
  end

  resources :user_follow_tags

  resources :user_follow_locations

  resources :user_follow_users

  resources :user_curlocations

  resources :activity_tweets

  resources :activity_groups

  resources :activities do
    collection do
      get 'autopick'
      get 'mini_list'
      get 'ongoing_list'
      get 'new_fast'
      get 'collection'
    end
  end

  resources :user_group_follows do
      collection do
         get 'follow'
         get 'cancel_follow'
      end
  end

  resources :user_groups

  resources :location_map_point_imgs

  resources :location_maps do
    collection do
      get 'loadmap'
    end
  end
      
  
  resources :location_map_points do
    collection do
      post 'saveall'
    end
  end
  resources :locations do
    collection do
      get 'routepicker'
      get 'pick'
      get 'autopick'
      get 'mini_show'
      get 'at_here'
    end
  end

  resources :tweets do
    collection do
      get 'show_list'
      get 'list'
      get 'index_group'
      post 'publish'
      get 'mini_list'
    end

  end
  resources :comments

  resources :users do
    collection do
      get 'login'
      get 'check'
      get 'logout'
      get 'home'
      post 'reg'
    end
    member do
      get 'profile'
    end
  end
  
  match 'search/autocomplete' => 'search#autocomplete'
  match 'home' =>'public#home'
  match 'public/addfollow' => 'public#addfollow'
  match 'public/cancelfollow' => 'public#cancelfollow'
  match 'public/search_autocomplete' =>'public#search_autocomplete'
  match 'public/search' =>'public#search'
  match 'public/online_user' =>'public#online_user'
  match 'timemachine' => 'public#timemachine'
  match 'location_edit'=>'public#location_edit'
  match 'register'=>'users#new'
  match 'login'=>'users#login'
  match '/'=>'public#home'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

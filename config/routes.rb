Bobuli::Application.routes.draw do
  
  root :to => 'sessions#new'
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"


  match 'contact', :to => 'pages#contact'
  match 'about',   :to => 'pages#about'
  match 'home', :to => 'pages#home'
  
  

  match 'users/activate_tippgemeinschaft', :to => 'users#activate_tippgemeinschaft', :as => 'activate_tippgemeinschaft'	
  match 'users/activate_account', :to => 'users#activate_account', :as => 'activate_account'
  match 'sesssions/change_password', :to => 'sessions#change_password', :as => 'change_password'
  match 'sesssions/update_password', :to => 'sessions#update_password', :as => 'update_password'

  #:to => 'users#activate_account'	  


  resources :user_tippgemeinschafts

  get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy, :passwordForgotten] do
  	#post 'reset'
  end
 
  match '/updateTippg',  :to => 'sessions#setTippg'
  
  
  match '/signup',  :to => 'users#new'
  match '/password_forgotten',  :to => 'sessions#password_forgotten'
  match '/reset_password',  :to => 'sessions#reset'
  
  match '/signin',  :to => 'sessions#new'
  
  match '/signout', :to => 'sessions#destroy'
  match '/vereine', :to => 'vereins#index'

  resources :users do
  	get 'inviteToGroup', :on => :member
  	post 'invite', :on => :member
    resources :tipps
  end
  resources :tipps
  resources :spielbegegnungs
  resources :vereins


  resources :tippgemeinschafts do
  	post 'chooseTippgemeinschaft', :on => :member
  end


  

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

#resources :posts

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

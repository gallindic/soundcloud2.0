Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  #Nardi route za music controller
  resources :musics do
    member do
      #Naredi dva nova routea, like in pa unlike
      put "like" => "musics#upvote"
      put "unlike" => "musics#downvote"
    end
    
    resources :comments
  end
  
  resources :users
  
  #Root page
  authenticated :user do
    #Če je uporabnik prijavljen je ta page root page
    root :to => 'pages#home', as: :authenticated_root
  end
  root :to => 'pages#index' #Če uporabnik ni prijavljen je ta page root page
  
  #Ustvarjeni routei
  get '/profile/:id' => 'pages#profile', as: :profile
  get '/index' => 'pages#index'
  get '/settings' => 'pages#settings'
  get '/explore' => 'pages#explore'
  get '/home' => 'pages#home'
<<<<<<< HEAD
  
  
  
=======
>>>>>>> 8230f8a4174e98de900d172b67892cdf004729fd
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

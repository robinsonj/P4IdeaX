BBYIDX::Application.routes.draw do
  root :to => "home#index"

  devise_for :users
  # resources :users

  match '/index'    => 'home#index',    via: 'get',   :as => :home_index
  match '/about'    => 'home#about',    via: 'get',   :as => :home_about
  match '/contact'  => 'home#contact',  via: 'get',   :as => :home_contact

  resources :ideas do
    resources :comments

    collection do
      post 'search', to: 'ideas#index'
    end

    member do
      resource :vote, only: [] do
        post    ''        => :create,  :as => 'create_idea' # Creates url helper method 'create_idea_vote_path'
        patch   '/update' => :update,  :as => 'change_idea'
        delete  '/remove' => :destroy, :as => 'remove_idea'
      end
    end
  end

  resources :tags, only: [:index]

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

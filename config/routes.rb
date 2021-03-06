BBYIDX::Application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  match '/user/:id'         => 'users#show',             via: 'get',   :as => :user_profile
  match '/index'            => 'home#index',            via: 'get',   :as => :home_index
  match '/about'            => 'home#about',            via: 'get',   :as => :home_about
  match '/contact'          => 'home#contact',          via: 'get',   :as => :home_contact
  match '/terms_of_use'     => 'home#terms_of_use',     via: 'get',   :as => :home_tou

  resources :ideas do
    get :autocomplete_tag_name, on: :collection

    resources :comments, except: [:index]

    collection do
      get 'search', to: 'ideas#search'
    end

    member do
      resource :vote, only: [] do
        post ''        => :create,  :as => 'create_idea' # Creates url helper method 'create_idea_vote_path'
        patch '/update' => :update,  :as => 'change_idea'
        delete '/remove' => :destroy, :as => 'remove_idea'
      end
    end
  end

  resources :tags, only: [:index, :show]
  resources :currents, only: [:index, :show]

  namespace :admin do
    match '' => 'dashboard#index', via: 'get', as: :dashboard

    resources :ideas, :currents, only: [:index, :edit, :create, :update, :destroy]
    resources :tags
  end
end

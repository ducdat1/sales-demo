Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'authentication/sessions'
  }

  get 'rooms/show'

  scope "(:locale)", locale: /en|vi/ do
    resources :people
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :line_items
    resources :carts, except: [:index, :edit]
    resources :products
    resources :posts
    resources :users
    resources :categories, only: [:index, :show]

    namespace :manager do
      resources :categories
    end
    get 'display' => 'home#post_display'
    post 'add_fav' => 'posts#add_favorite'
    #checkout cart
    get 'checkout' => 'checkouts#checkout'
    post 'confirm' => 'checkouts#confirm'
    #signin & sign up
    controller :sessions do
      get 'login' => :index
      post 'login' => :create
      delete 'logout' => :destroy
    end

    root "home#index"
  end
  resources :comments, only: [:create, :index, :destroy]

  get 'budgets' => 'budgets#download'
  mount ActionCable.server => '/cable'

  get 'room' => 'rooms#show'
  # get '*path', to: 'home#index'
end

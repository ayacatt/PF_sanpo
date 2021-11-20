Rails.application.routes.draw do

    # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

    resources :contacts, only: [:new, :create, :index, :show, :update]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'

    resources :relationships, only: [:create, :destroy]

    get 'search' => 'user/posts#search'
    

  scope module: :user do
    root to: "homes#top"
    get "/about" => "homes#about"

    resources :maps, only: [:index]
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:new, :create, :edit, :index, :show, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
   get "homes/top" => "homes#top"
   resources :genres
   resources :users
  end
end
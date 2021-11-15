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

  scope module: :user do
    root to: "homes#top"
    get "/about" => "homes#about"

    resources :maps, only: [:index]
    resources :users, only: [:show, :edit, :update]
    resource :relationships, only: [:create, :destroy]
    resources :posts, only: [:new, :create, :edit, :index, :show, :destroy, :update] do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]


    end
  end


end
Rails.application.routes.draw do
  
  scope module: :user do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
     resources :post_comments, only: [:create, :destroy]
    end
  
  end 
  
  
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
end

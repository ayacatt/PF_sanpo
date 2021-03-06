Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: %i[registrations passwords], controllers: {
    sessions: 'admin/sessions'
  }

  resources :relationships, only: %i[create destroy]
  get 'search' => 'user/posts#search'

  scope module: :user do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :maps, only: [:index]
    resources :users, only: %i[index show edit update]
    resources :contacts, only: %i[new create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
    resources :posts, only: %i[new create edit index show destroy update] do
      resource :favorites, only: %i[create destroy]
      resources :post_comments, only: %i[create destroy]
    end
  end

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :genres
    resources :users
    resources :contacts, only: %i[index show update]
  end
end

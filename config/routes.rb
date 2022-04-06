Rails.application.routes.draw do

  # 管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  # 顧客用 URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'mypage' => 'customers#show', as: 'mypage'
    get 'mydata/edit' => 'customers#edit', as: 'myedit'
    patch 'mydata' => 'customers#update', as: 'myupdate'
    # resources :customers, only:[:edit, :update]
    get 'cats/new' => 'post_images#new', as: 'new_post_image'
    post 'cats' => 'post_images#create'
    # as:の記述がいるのかどうか不明↑
    get 'cats' => 'post_images#index', as: 'post_images'
    get 'cats/:id' => 'post_images#show', as: 'post_image'
    get 'cats/:id/edit' => 'post_images#edit', as: 'edit_post_image'
    patch 'cats/:id' => 'post_images#update', as: 'update_post_image'
    delete 'cats/:id' => 'post_images#destroy', as: 'destroy_post_image'
    # resources :post_images
  end

  end

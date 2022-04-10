Rails.application.routes.draw do

  # 管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  # 会員用 URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  scope module: :user do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'mypage' => 'users#show', as: 'mypage'
    get 'mydata/edit' => 'users#edit', as: 'myedit'
    patch 'mydata' => 'users#update', as: 'myupdate'
    get 'cats/new' => 'post_images#new', as: 'new_post_image'
    post 'cats' => 'post_images#create'
    get 'cats' => 'post_images#index', as: 'post_images'
    get 'cats/:id' => 'post_images#show', as: 'post_image'
    get 'cats/:id/edit' => 'post_images#edit', as: 'edit_post_image'
    patch 'cats/:id' => 'post_images#update', as: 'update_post_image'
    delete 'cats/:id' => 'post_images#destroy', as: 'destroy_post_image'
    get 'unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw'
    # post_imageをresoucesにしてないのでresouceが使えない
    delete 'post_images/:post_image_id/favorites' => 'favorites#destroy', as: 'post_image_destroy_favorites'
    post 'post_images/:post_image_id/favorites' => 'favorites#create', as: 'post_image_favorites'
    delete 'post_images/:post_image_id/post_comments/:id' => 'post_comments#destroy', as: 'post_image_destroy_post_comments'
    post 'post_images/:post_image_id/post_comments' => 'post_comments#create', as: 'post_image_post_comments'
  end

end
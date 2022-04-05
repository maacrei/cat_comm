Rails.application.routes.draw do
  
  # 管理者用 URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :customers, only: [:index, :edit, :update]
  end

  # 顧客用 URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  scope module: :customer do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    resource :customers, only:[:edit, :update]
  end

  end

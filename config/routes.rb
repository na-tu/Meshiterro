Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], #管理者の新規登録とパスワード機能は不要。ルーティングをスキップ（無効）
    controllers: {sessions: 'admin/sessions'}#管理者のログイン画面に/admin/sign_inというURLで遷移できるようにルーティング
   
  root to: "homes#top"
  devise_for :users
  resources :post_images, only: [:new, :index, :show, :create, :destroy]do
    resource :favorite, only: [:create, :destroy]#単数形にすると、/:idがURLに含まれない.
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit,:update]
  #resourcesは、コントローラに紐づいたアクションをまとめて指定できる書き方.
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/about', to: 'homes#about', as: 'about'
end

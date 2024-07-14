Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], #管理者の新規登録とパスワード機能は不要。ルーティングをスキップ（無効）
    controllers: {sessions: 'admin/sessions'}#管理者のログイン画面に/admin/sign_inというURLで遷移できるようにルーティング
   
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'#管理者ダッシュボードへのルーティング
    #/admin/dashbordsにアクセスするとadmin/dashboards_controller.rbのindexアクションを処理
    
    resources :users, only: [:destroy]
  end
   
  
  scope module: :public do#コントローラーはpublicという名前空間内に配置、URLパスからはpublicが除外。今までと同様にアクセス,
  devise_for :users
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: 'about'
  resources :post_images, only: [:new, :index, :show, :create, :destroy]do
    resource :favorite, only: [:create, :destroy]#単数形にすると、/:idがURLに含まれない.
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit,:update]
  end
  #resourcesは、コントローラに紐づいたアクションをまとめて指定できる書き方.
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 
end

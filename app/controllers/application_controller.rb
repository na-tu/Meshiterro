class ApplicationController < ActionController::Base
 before_action :authenticate_user!, except: [:top],unless: :admin_controller?#authenticate_user!フィルターが適用されなくなる状態を作り出す(権限の設定)


 private
 
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
      authenticate_user! unless action_is_public?
    end
  end
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end#Admin名前空間内のコントローラー（例: Admin::DashboardController）では
  #authenticate_user!フィルターが適用されなくなります。
  #これは、管理者用のコントローラーでエンドユーザー側の認証を避け、
  #代わりに管理者用の認証（例: authenticate_admin!）を行いたい場合に役立.
 
  def action_is_public?
    controller_name == 'homes' && action_name == 'top'
  end
 
end

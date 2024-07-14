class Admin::DashboardsController < ApplicationController
  layout 'admin'#管理者でログインしている際には、ログアウトのリンクが表示される
  
  #before_action :authenticate_admin!#ユーザーの一覧表示の機能
    def index
        @users = User.all
    end
end

class ApplicationController < ActionController::Base
 before_action :authenticate_user!, except: [:top]
 before_action :configure_permitted_parameters, if: :devise_controller?#devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行

  def after_sign_in_path_for(resource)
    post_images_path #ログイン後は投稿画像一覧（post_images）に遷移.
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected#呼び出された他のコントローラからも参照できる。（privateは記述をしたコントローラ内でしか参照できない）

  def configure_permitted_parameters#これをコマンドすることで、”devise_parameter_sanitizer.permitメソッドを使うとユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可する。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end

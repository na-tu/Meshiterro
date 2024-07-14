class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

  def index 
  end
  
  def show
    @user = User.find(params[:id])
    #IDのユーザーレコードを見つけて、それと関連する投稿画像を@post_imagesという変数に格納
    @post_images = @user.post_images.page(params[:page])
  end

  #def edit #編集
   #user = User.find(params[:id])
  #unless user.id == current_user.id
    #redirect_to post_images_path
  #end
    #@user = User.find(params[:id])
  #end

def edit
  #is_matching_login_user
  @user = User.find(params[:id])
end

  #def update
    #user = User.find(params[:id])
  #unless user.id == current_user.id
    #redirect_to post_images_path
  #end
    #@user = User.find(params[:id])#ユーザーの取得
    #@user.update(user_params)#ユーザーのアップデート
    #redirect_to user_path(@user.id)#ユーザーの詳細ページへのパス

def update
  #is_matching_login_user
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
 def is_matching_login_user
    #user = User.find(params[:id])
    #unless user.id == current_user.id
      #redirect_to post_images_path
    #end
     #↓
    #is_matching_login_user
  end
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #IDのユーザーレコードを見つけて、それと関連する投稿画像を@post_imagesという変数に格納
    @post_images = @user.post_images
    #（@user）に関連付けられた投稿全て（.post_images）を取得し@post_imagesに渡す という処理.
  end

  def edit #編集
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])#ユーザーの取得
    @user.update(user_params)#ユーザーのアップデート
    redirect_to user_path(@user.id)#ユーザーの詳細ページへのパス  
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
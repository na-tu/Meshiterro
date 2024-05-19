class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params) #フォームに入力したデータが@post_imageに格納
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
     @post_images = PostImage.all #post_imagesテーブル内に存在する全てのレコードのインスタンスを代入

  end

  def show
     @post_image = current_user.post_images.find(params[:id])
     #current_userはログイン中のユーザーを表す。`post_images`はUserモデルとPostImageモデルの間に定義された関連.
     #findは、指定したidと関連するUserが所有するPostImageを検索.
     @post_comment = PostComment.new
  end
  
  def destroy
    post_image = 削除するPostImageレコードを取得
    post_image.削除
    redirect_to PostImageの一覧ページへのパス
  end

   # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end

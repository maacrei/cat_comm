class User::FavoritesController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    # 同じページをリダイレクト
    redirect_to request.referer
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    # 同じページをリダイレクト
    redirect_to request.referer
  end

end

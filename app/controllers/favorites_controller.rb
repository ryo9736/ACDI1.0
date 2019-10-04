class FavoritesController < ApplicationController
  def create
    favorite =  current_user.favorites.create(post_id: params[:post_id])
    flash[:info] = 'お気に入り登録しました'
    redirect_to posts_url
  end
    
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:alert] = 'お気に入り解除しました'
    redirect_to posts_url
  end
end

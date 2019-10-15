class ReviewsController < ApplicationController
  before_action :set_reviews, only:[:edit, :update, :destory]

  def index
     @reviews = review.all
     @reviwer = current_user
  end

  def create
    @user = User.find(params[:user_id])
    @review = @user.reviews.build(review_params)
    @reviwer = current_user
    @review.save
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
    end
  end

  def edit
    @review = Review.find(params[:id])
    @user = User.find(params[:user_id])
    @reviwer = current_user
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js { render :action => "edit" }
    end
  end
  #ajaxに二つの


  def update
    @user = User.find(params[:user_id])
    if @review.update(review_params)
       @reviews = @user.reviews
    end
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @user = User.find(params[:user_id])
    if @review.destroy
       @reviews = @user.reviews
    end
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
    end
  end


  private

  def review_params
    params.require(:review).permit(:user_id, :content, :reviewer_id)
  end

  def set_reviews
    @review = Review.find(params[:id])
  end
end

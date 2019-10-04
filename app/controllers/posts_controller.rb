class PostsController < ApplicationController
    before_action :set_posts, only:[:show, :edit, :update, :destory]
    before_action :ensure_correct_user, only:[:edit, :update, :destroy]

    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        flash[:info] = '投稿に成功しました'
        redirect_to post_path(@post.id)
      else
        flash[:alert] = '投稿に失敗しました'
        render 'new'
      end
    end

    def index
      @posts = Post.page(params[:page])
    end
  
    def show
      @user = @post.user
      # @favorite = current_user.favorites.find_by(post_id:@post.id)
    end
  
    def edit
      @user = @post.user
    end
  
    def update
      @post.user_id = current_user.id
      if @post.update(post_params)
        redirect_to post_path(@post.id)
      else
        render 'edit'
      end
    end
  
    def destroy
      @post.destroy
      flash[:alert] = '投稿を削除しました'
      redirect_to posts_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title,:start_reason,:purpose,:current_status,:target,:like_points)
    end
  
    def set_posts
      @post = Post.find(params[:id])
    end
  
    def ensure_correct_user
      @post = Post.find_by(id:params[:id])
      if @post.user_id != current_user.id
        flash[:alert] = '権限がありません'
        redirect_to posts_path
      end
    end
  end 
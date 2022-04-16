class User::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    @user = current_user
    @genres = Genre.all
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def index
    # .order(created_at: :desc)で投稿を新着順に表示
    @post_images = PostImage.order(created_at: :desc)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    # @comment = PostComment.new
  end

  def edit
  end

  def update
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def search_genre
    @post_image = PostImage.new
    # .order(created_at: :desc)で投稿を新着順に表示
    @post_images = PostImage.search(params[:keyword]).order(created_at: :desc)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :title , :caption, :genre_id)
  end

end

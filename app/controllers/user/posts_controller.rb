class User::PostsController < ApplicationController

  def new
    @post = Post.new
    @post.build_spot
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
    @user = current_user
    @relationship = Relationship.all
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def edit
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.all
    @user = current_user
    @relationship = Relationship.all
    @genres = Genre.all
    @posts = Post.search(params[:genre_id])
    @keyword = params[:genre_id]
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :genre_id, :evaluation, spot_attributes: [:address])
  end

end



class PostsController < ApplicationController

  def new
    @post = Post.new
    

  end

  def create
    @post = Post.new(post_params)
    ps = PostSub.new(post_id: @post.id, sub_id: params[:sub_id])
    ps.save!
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id]) 
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  def destroy
    @post = Post.find(params[:id]) 
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, post_sub_ids: [])
  end

end
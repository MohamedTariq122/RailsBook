class PostsController < ApplicationController
before_action :authenticate_user!, only: [ :create, :edit, :update, :destroy ]
before_action :set_post, only: [ :show, :edit, :update, :destroy ]
before_action :check_post_ownership, only: [ :edit, :update, :destroy ]

  def index
    @posts = if params[:search].present?
      Post.search(params[:search]).order(created_at: :desc)
    elsif params[:category]
      category = Category.find_by!(slug: params[:category])
      category.posts.order(created_at: :desc)
    else
      Post.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

def check_post_ownership
unless @post.editable_by?(current_user)
    redirect_to posts_path, alert: "You are not authorized to perform this action."
end
end

  def post_params
    params.require(:post).permit(:title, :content, :category_names)
  end
end

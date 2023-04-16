class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(form_params)
    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to @post
    else
      flash[:failure] = 'Post cannot be created'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post  = Post.find(params[:id])
  end

  def update
    @post  = Post.find(params[:id])
    if @post.update(form_params)
      flash[:success] = 'New post was successfully updated'
      redirect_to @post
    else
      flash[:failure] = 'Post cannot be updated'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was deleted'
      redirect_to posts_path
    else
      flash[:failure] = 'Post cannot be deleted'
      redirect_to @post
    end
  end

  def form_params
    params.require('post').permit(:title, :body, :summary, :published)
  end
end

class PostsController < ApplicationController
	def index
		@posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 3)

	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
			flash[:notice] = "New Post created."
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "#{@post.title} has been updated!"
			redirect_to @post
		else
			render 'edit'
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
		flash[:danger] = "#{@post.title} has been deleted!"
	end

	private
		def post_params
			params.require(:post).permit(:title, :body, :image)
		end
end

class CommentsController < ApplicationController

	def new
		@post = Post.find(params[:post_id])
	end
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save
			redirect_to post_path(@post)
			flash[:notice] = "Your comment has been created."
		else
			render 'new'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
		flash[:danger] = "The comment has been deleted."
	end

private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end

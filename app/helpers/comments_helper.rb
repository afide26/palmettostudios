module CommentsHelper
	def comment_time(comment)
		comment.strftime("%B, %d, %Y")
	end
end

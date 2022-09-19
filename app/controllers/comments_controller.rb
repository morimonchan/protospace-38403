class CommentsController < ApplicationController

 def create
    @comment = Comment.new(comment_params)
   if @comment.save
     redirect_to prototype_path(@comment.prototype)
    #  (@comment.prototype)とはどのような意味？？新しい投稿に紐づくprototype
    # つまりまさに今(new)投稿したコメントに戻りたい。
   else
      @prototype = @comment.prototype
      @comments = @prototype.comments
     render "prototypes/show"
   end
 end

 private
 def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id] )
 end

end

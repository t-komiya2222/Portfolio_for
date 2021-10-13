class CommentsController < ApplicationController

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = "コメント投稿しました"
      redirect_to portfolio_path(@portfolio)
    else
      flash[:danger] = "コメントを入力してください。"
      redirect_to portfolio_path(@portfolio)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    Comment.find(params[:id]).destroy
    flash[:success] = "コメント削除完了"
    redirect_to portfolio_path(@comment.portfolio_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, portfolio_id: params[:portfolio_id])
  end
end

class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :set_like

  def create
      @user = current_user
      @portfolio = Portfolio.find(params[:portfolio_id])
      @like = Like.create(user_id: @user.id, portfolio_id: @portfolio.id)
  end
  
  def destroy
      @user = current_user
      @portfolio = Portfolio.find(params[:portfolio_id])
      @like = Like.find_by(user_id: @user.id, portfolio_id: @portfolio.id)
      @like.delete
  end

  private
  def set_like
      @portfolio = Portfolio.find(params[:portfolio_id])
  end
end

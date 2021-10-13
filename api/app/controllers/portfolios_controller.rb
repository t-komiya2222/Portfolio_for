class PortfoliosController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      flash[:success] = "Portfolio created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @comments = @portfolio.comments.order(created_at: :asc)
    @like = @portfolio.likes.count
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to portfolio_url , notice: '情報を更新しました。'
    else
      redirect_to portfolio_url , notice: '情報を更新に失敗しました。'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    Portfolio.destroy(@portfolio.id)
    flash[:success] = "削除完了しました。"
    redirect_to current_user
  end

  def search
    @portfolio = Portfolio.published.search(params[:keyword])
    @keyword = params[:keyword]
    render 'static_pages/home'
  end

  def confirm
    @draft = current_user.portfolios.draft.reverse_order
  end

  def sort
    @sortkey = params[:sortkey]
    @portfolio_new = Portfolio.published.order(created_at: :desc)
    case @sortkey
    #|でいいねがついている投稿とついていない投稿を繋げる
    when "like" then
      @portfolio_like = Portfolio.find(Like.group(:portfolio_id).order('count(portfolio_id) desc').pluck(:portfolio_id))
      @portfolio = @portfolio_like | @portfolio_new
      render 'static_pages/home'
    else
      @portfolio = @portfolio_new
      render 'static_pages/home'
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:image, :name, :period, :target, :issue, :way, :content, :image, :status)
  end
end

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Portfolio for!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @portfolio = @user.portfolios.published.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "更新完了"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザー削除完了"
    redirect_to root_path
  end

  def follow
    @user = User.find(params[:id])
    @user = @user.following_users
  end

  def follower
    @user = User.find(params[:id])
    @user = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :avatar)
  end
end

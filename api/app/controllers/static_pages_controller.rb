class StaticPagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def home
    @portfolio = Portfolio.published.order(created_at: :desc)
  end

end

class AddStatusToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :status, :integer, default: 0, null: false
  end
end

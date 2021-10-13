class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.text :image
      t.text :name
      t.text :period
      t.text :target
      t.text :issue
      t.text :way
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end

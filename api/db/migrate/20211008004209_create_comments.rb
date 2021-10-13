class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :portfolio_id, null: false
      t.text :body, null: false
      
      t.timestamps null: false
      
    end
  end
end

class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false
      t.references :followed, null: false

      t.timestamps null: false

      t.index [:follower_id, :followed_id], unique: true
    end
  end
end

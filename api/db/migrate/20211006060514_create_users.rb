class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :profile
      t.string :avatar

      t.timestamps null: false

      t.index :email, unique: true
    end
  end
end

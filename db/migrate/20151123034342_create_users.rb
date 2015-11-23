class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :chatwork_id
      t.string :email
      t.integer :role
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

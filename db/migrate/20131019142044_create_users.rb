class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password, limit: 16
      t.boolean :confirmed
      t.boolean :one_pager_allowed
      t.boolean :blocked

      t.timestamps
    end
  end
end

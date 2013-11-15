class CreateAnonymousUsers < ActiveRecord::Migration
  def change
    create_table :anonymous_users do |t|
      t.string :email, limit: 30
      t.integer :counter

      t.timestamps
    end
  end
end

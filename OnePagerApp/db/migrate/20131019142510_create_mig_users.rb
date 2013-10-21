class CreateMigUsers < ActiveRecord::Migration
  def change
    create_table :mig_users do |t|
      t.string :email, limit: 30
      t.string :password, limit: 16

      t.timestamps
    end
  end
end

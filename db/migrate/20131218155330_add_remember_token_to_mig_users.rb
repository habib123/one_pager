class AddRememberTokenToMigUsers < ActiveRecord::Migration
 def change
    add_column :mig_users, :remember_token, :string
    add_index  :mig_users, :remember_token
  end
end

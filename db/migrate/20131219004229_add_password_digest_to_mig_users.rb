class AddPasswordDigestToMigUsers < ActiveRecord::Migration
   def change
    rename_column :mig_users, :password, :password_digest
    change_column :mig_users, :password_digest, :string
  end
end

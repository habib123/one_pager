class AddPasswordDigestToMigUsers < ActiveRecord::Migration
  def change
    add_column :mig_users, :password_digest, :string
  end
end

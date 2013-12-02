class FixPasswordColumnNameToUser < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_digest
    change_column :users, :password_digest, :string
  end
end

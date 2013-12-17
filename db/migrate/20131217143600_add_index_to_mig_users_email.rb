class AddIndexToMigUsersEmail < ActiveRecord::Migration
  def change
    add_index :mig_users, :email, unique: true
  end
end

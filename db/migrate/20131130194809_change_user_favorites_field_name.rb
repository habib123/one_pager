class CreateUserFavorites < ActiveRecord::Migration
  def change
	rename_column :user_favorites, :user_id, :userId
	rename_column :user_favorites, :one_pager_id, :onePagerId
  end
end

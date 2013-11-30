class CreateUserFavorites < ActiveRecord::Migration
  def change
    create_table :user_favorites do |t|
      t.integer :userId
      t.integer :onePagerId

      t.timestamps
    end
  end
end

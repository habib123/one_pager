class CreateOnePagersTags < ActiveRecord::Migration
  def change
    create_table :one_pagers_tags do |t|
      t.integer :one_pager_id
      t.string :tag, limit: 20

      t.timestamps
    end
  end
end

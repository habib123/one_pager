class CreateOnePagersPatentNums < ActiveRecord::Migration
  def change
    create_table :one_pagers_patent_nums do |t|
      t.integer :one_pager_id
      t.string :patent_num

      t.timestamps
    end
  end
end

class CreateOnePagers < ActiveRecord::Migration
  def change
    create_table :one_pagers do |t|
      t.integer :user_id
      t.string :patent_name
      t.string :html_link
      t.string :pdf_link
      t.string :img_link
      t.string :company_name
      t.string :single_patent_num, limit: 15
      t.string :type, limit: 15
      t.string :mig_status, limit: 15
      t.boolean :created_status
      t.boolean :email_status
      t.text :comments
      t.date :date

      t.timestamps
    end
  end
end

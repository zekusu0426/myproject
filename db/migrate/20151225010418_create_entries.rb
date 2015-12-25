class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :site_url
      t.string :entry_name
      t.string :entry_url
      t.string :entry_image
      t.string :entry_summary

      t.timestamps null: false
    end
  end
end

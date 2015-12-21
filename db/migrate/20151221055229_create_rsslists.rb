class CreateRsslists < ActiveRecord::Migration
  def change
    create_table :rsslists do |t|
      t.string :url
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :rsslists, [:member_id, :created_at]
  end
end

class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :gooder_id
      t.integer :gooded_id

      t.timestamps null: false
    end
    add_index :goods, :gooder_id
    add_index :goods, :gooded_id
    add_index :goods, [:gooder_id, :gooded_id], unique: true
  end
end

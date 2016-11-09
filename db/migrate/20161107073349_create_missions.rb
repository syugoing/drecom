class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.string :content
      t.integer :status

      t.timestamps null: false
    end
  end
end

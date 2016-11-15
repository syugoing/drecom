class AddColumnToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :share, :integer, null: false, default: 0
    add_column :missions, :share, :integer, null: false, default: 0
  end
end

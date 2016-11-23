class AddtitleToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :title, :string, null: false, default: ""
    add_column :topics, :today, :boolean, null: false, default: false
  end
end

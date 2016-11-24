class AddGenreToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :genre, :string, null: false, default: ""
  end
end

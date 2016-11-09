class AddStatusToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :status, :integer
  end
end

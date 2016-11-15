class Good < ActiveRecord::Base
  belongs_to :gooder, class_name: "User"
  belongs_to :gooded, class_name: "Topic"
end

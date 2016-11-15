class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :goods, foreign_key: "gooded_id", dependent: :destroy
  has_many :gooders, through: :goods, source: :gooder
end

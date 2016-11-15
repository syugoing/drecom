class SharesController < ApplicationController
  def index
    @topics = Topic.all
    @missions = Mission.all
  end
end

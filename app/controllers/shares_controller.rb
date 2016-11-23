class SharesController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all
    @topic = Topic.new
    @missions = Mission.all
    @comment = @topic.comments.build
    @comments = Comment.all
  end
end

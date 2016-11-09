class TodaystatusController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def update
    @topic = Topic.find(params[:id])
    @topic.status = 1
    @topic.save
    redirect_to topics_path
    # respond_with @mission
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.status = 2
    @topic.save
    redirect_to topics_path
  end

end

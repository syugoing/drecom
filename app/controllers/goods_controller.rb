class GoodsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @topic = Topic.find(params[:good][:gooded_id])
    current_user.good!(@topic)
    respond_with @topic
  end

  def destroy
    @topic = Good.find(params[:id]).gooded
    current_user.ungood!(@topic)
    respond_with @topic
  end
end

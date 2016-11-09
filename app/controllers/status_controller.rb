class StatusController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def update
    @mission = Mission.find(params[:id])
    @mission.status = 1
    @mission.save
    redirect_to topics_path
    # respond_with @mission
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.status = 2
    @mission.save
    redirect_to topics_path
  end
end

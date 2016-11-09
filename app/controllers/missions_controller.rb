class MissionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(missions_params)
    if @mission.save
      redirect_to topics_path, notice: "作成しました。"
    else
      redirect_to topics_path, notice: "作成失敗しました"
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(missions_params)
    if @mission.save
      redirect_to topics_path, notice: "項目を編集しました。"
    else
      redirect_to topics_path, notice: "項目を編集を失敗しました"
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to topics_path, notice: "項目を削除しました！"
  end

private
  def missions_params
    params.require(:mission).permit(:title, :content, :status)
  end

end

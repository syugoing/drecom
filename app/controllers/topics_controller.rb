class TopicsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @topics = Topic.all
    @topic = Topic.new
    @today = false
    @missions = Mission.all
  end


  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "投稿しました。"
    else
      redirect_to topics_path, notice: "登録失敗しました"
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "項目を編集しました。"
    else
      redirect_to topics_path, notice: "項目を編集を失敗しました"
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: "投稿を削除しました！"
  end

  def push(button)
    @mission = Mission.find(params[:id])
    if button==1 then
      @mission.status==1
    end
  end

private
  def topics_params
    params.require(:topic).permit(:content, :status)
  end

end

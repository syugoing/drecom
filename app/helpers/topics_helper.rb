module TopicsHelper
  def choose_new_or_edit
    if action_name == 'new'
      missions_path
    elsif action_name == 'edit'
      mission_path
    end
  end

  def shared_range(topic)
    if topic.share == 0
      return "公開"
    elsif topic.share == 1
      return "友達のみ"
    elsif topic.share == 2
      return "非公開"
    end
  end
  
end

module MissionsHelper
  def choose_new_or_edit
    if action_name == 'new'
      missions_path
    elsif action_name == 'edit'
      mission_path
    end
  end
end

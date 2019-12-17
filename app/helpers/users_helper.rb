module UsersHelper
  def confirmation_screen
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_users_path
    end
  end
end

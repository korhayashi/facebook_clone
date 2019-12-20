module EntriesHelper
  def choose_index_or_edit
    if action_name == 'index' || action_name == 'confirm' ||
       action_name == 'create' || action_name == 'show'
      confirm_entries_path
    elsif action_name == 'edit'
      entry_path
    end
  end
end

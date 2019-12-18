class AddParentEntryId < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :parent_entry_id, :integer
  end
end

class RemoveHeadImageToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :head_image, :string
  end
end

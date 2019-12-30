class AddColmnHeadImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :head_image, :string
  end
end

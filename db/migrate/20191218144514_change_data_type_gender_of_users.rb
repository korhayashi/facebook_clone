class ChangeDataTypeGenderOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender, 'integer USING CAST(gender AS integer)'
  end
end

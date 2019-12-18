class ChangeDataToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_year, 'integer USING CAST(birth_year AS integer)'
    change_column :users, :birth_month, 'integer USING CAST(birth_month AS integer)'
    change_column :users, :birth_day, 'integer USING CAST(birth_day AS integer)'
  end
end

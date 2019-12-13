class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "family_name"
      t.string "first_name"
      t.string "email"
      t.string "password_digest"
      t.string "birth_year"
      t.string "birth_month"
      t.string "birth_day"
      t.string "gender"

      t.timestamps
    end
  end
end

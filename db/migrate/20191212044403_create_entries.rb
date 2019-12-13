class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end

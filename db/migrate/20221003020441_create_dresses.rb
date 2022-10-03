class CreateDresses < ActiveRecord::Migration[6.1]
  def change
    create_table :dresses do |t|
      t.integer :user_id
      t.integer :season_id
      t.text :caption
      t.integer :category

      t.timestamps
    end
  end
end

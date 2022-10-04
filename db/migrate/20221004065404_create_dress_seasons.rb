class CreateDressSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :dress_seasons do |t|
      t.references :dress, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end

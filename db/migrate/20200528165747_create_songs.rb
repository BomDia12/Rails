class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :explicit
      t.references :album, null: false, foreign_key: true
      t.references :musical_gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end

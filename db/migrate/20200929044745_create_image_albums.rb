# frozen_string_literal: true

class CreateImageAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :image_albums do |t|
      t.references :album, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end

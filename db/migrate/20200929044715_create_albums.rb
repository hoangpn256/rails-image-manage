# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :avatar
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

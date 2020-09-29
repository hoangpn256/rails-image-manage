# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.datetime :publish_date
      t.string :description
      t.string :image
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

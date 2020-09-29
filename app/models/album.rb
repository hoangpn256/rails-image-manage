# frozen_string_literal: true

class Album < ApplicationRecord
  has_many :image_albums
  has_many :images, through: :image_albums
  mount_uploader :image, ImageUploader
  validates :title, presence: true

  enum status: %i[publish personal pending]
end

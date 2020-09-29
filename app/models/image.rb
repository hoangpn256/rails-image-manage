# frozen_string_literal: true

class Image < ApplicationRecord
  has_many :image_albums
  has_many :albums, through: :image_albums

  mount_uploader :image, ImageUploader
  validates :image, presence: true
  before_save :set_date_publish
  enum status: %i[publish personal pending]
  scope :authorized_lists, -> { where(status: [PUBLISH_STATUS, PERSONAL_STATUS]) }
  PUBLISH_STATUS = 'publish'
  PERSONAL_STATUS = 'personal'

  private

  def set_date_publish
    return if publish_date.present?

    self.publish_date = Time.now
  end
end

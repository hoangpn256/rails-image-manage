# frozen_string_literal: true

class ImageAlbum < ApplicationRecord
  belongs_to :album
  belongs_to :image
end

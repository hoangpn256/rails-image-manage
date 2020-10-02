# frozen_string_literal: true

class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image, :title, :description, :publish_date
  has_many :albums
end

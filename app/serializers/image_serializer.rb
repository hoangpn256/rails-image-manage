# frozen_string_literal: true

class ImageSerializer < ActiveModel::Serializer
  attributes :id, :image, :title

  def initialize(object, options = {})
    super
    @options = options
  end

  def attributes(*args)
    detail_scope(super)
  end

  private

  attr_reader :options

  def detail_scope(attributes)
    return attributes unless options[:detail]

    attributes.merge!(description: object.description, publish_date: object.publish_date, albums: object.albums)
  end
end

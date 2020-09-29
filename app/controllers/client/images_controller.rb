# frozen_string_literal: true

module Client
  class ImagesController < ApplicationController
    before_action :set_images
    before_action :set_image, only: :show

    def index
      pagy, @images_pagy = pagy(@images, page: params[:page], items: ApplicationHelper::PER_PAGE_20)
      images = @images_pagy.map { |image| ImageSerializer.new(image) }
      pagy_response(pagy, images: images)
    end

    def show
      success_response(ImageSerializer.new(@image, { detail: true }))
    end

    private

    def set_images
      @images = user_signed_in? ? Image.publish : Image.authorized_lists
    end

    def set_image
      @image = @images.find(params[:id])
    end
  end
end

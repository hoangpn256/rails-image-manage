# frozen_string_literal: true

module Response
  def success_response(object, status = :ok)
    render json: { status: true, data: object }, status: status
  end

  def error_response(object, status = :ok)
    render json: { status: false, data: object }, status: status
  end

  def pagy_response(pagy, object)
    paginate = { current_page: pagy.page, total_pages: pagy.pages }
    success_response(object.merge(paginate: paginate))
  end
end

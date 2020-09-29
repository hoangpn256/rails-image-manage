# frozen_string_literal: true

module Response
  def success_response(object, status = :ok)
    render json: { status: true, data: object }, status: status
  end

  def error_response(object, status = :ok)
    render json: { status: false, data: object }, status: status
  end
end

class Api::V1::ApiController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    # rubocop:disable Lint/DuplicateBranch
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
      # rubocop:enable Lint/DuplicateBranch
    end
  end
end

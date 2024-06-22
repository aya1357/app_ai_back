require 'openai/api_client'
require 'request_text_formatter'

class Api::V1::Web::HomeController < Api::V1::Web::BaseController
  skip_before_action :verify_authenticity_token

  def create
    text = review_params[:text]
    request = review_params[:request]

    formatted_message = RequestTextFormatter.sample_request_formatter(text, request)

    response = Openai::ApiClient.new.call(formatted_message)

    render json: { response: response }
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def review_params
    params.require(:review).permit(:text, :request)
  end
end

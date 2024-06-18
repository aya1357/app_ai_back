require 'openai/api_client'

class ChatController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    response = Openai::ApiClient.new.call(params[:message])
    render json: { response: }
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end

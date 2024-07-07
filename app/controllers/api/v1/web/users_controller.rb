require 'auth_callback_error'

class Api::V1::Web::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActiveRecord::Base.transaction do
      user = User.find_or_create_by!(user_params)
      auth_provider = user.auth_providers.find_or_create_by!(auth_provider_params)
      raise AuthCallbackError, 'ログインに失敗しました' unless auth_provider.persisted?

      head :ok
    end
  rescue AuthCallbackError => e
    render json: { error: e.message }, status: :unprocessable_entity
  rescue StandardError => e
    render json: { error: "予期せぬエラーが発生しました: #{e.message}" }, status: :internal_server_error
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def auth_provider_params
    params.require(:user).require(:auth_provider).permit(:provider, :uid)
  end
end

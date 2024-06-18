require 'internal_server_error'
require 'service_unavailable_error'
require 'timeout_error'
require 'too_many_requests_error'
require 'unauthorized_error'

module Openai
  class ApiClient
    def initialize(model: 'gpt-3.5-turbo', timeout: 10)
      @model = model
      @connection = initialize_connection(timeout)
    end

    def call(input)
      body = build_body(input)
      response = post_request(url: '/v1/chat/completions', body: body)
      parse_response_message(response)
    end

    private

    def initialize_connection(timeout)
      Faraday.new(url: 'https://api.openai.com') do |f|
        f.headers['Authorization'] = "Bearer #{ENV.fetch('OPENAI_API_KEY')}"
        f.headers['Content-Type'] = 'application/json'
        f.options[:timeout] = timeout
        f.adapter Faraday.default_adapter
      end
    end

    def build_body(input)
      {
        model: @model,
        messages: [{ role: 'user', content: input }]
      }.to_json
    end

    def post_request(url: '/', body: '{}')
      response = @connection.post(url) { |req| req.body = body }
      handle_response_errors(response)
      response
    end

    def parse_response_message(response)
      response_hash = JSON.parse(response.body)
      content = response_hash.dig('choices', 0, 'message', 'content')
      raise StandardError, 'OpenAIからの返信が取得できませんでした。' if content.blank?

      content
    rescue JSON::ParserError
      raise StandardError, 'OpenAIからの返信が取得できませんでした。'
    end

    def handle_response_errors(response)
      return if response.status.between?(200, 299)

      exception_map = {
        401 => UnauthorizedError,
        429 => TooManyRequestsError,
        500 => InternalServerError,
        503 => ServiceUnavailableError
      }
      exception_to_raise = exception_map[response.status] || StandardError
      error_message = "不明なエラーです。ステータス: #{response.status}, エラーメッセージ: #{response.body}"
      raise exception_to_raise, parse_error_message(response.body) || error_message
    rescue Faraday::TimeoutError
      raise TimeoutError, 'リクエストがタイムアウトしました。もう一度お試しください。'
    rescue StandardError => e
      Rails.logger.error("エラーが発生しました: #{e.message}, バックトレース: #{e.backtrace.join("\n")}")
      raise e
    end

    def parse_error_message(response_body)
      parsed_message = begin
        response_json = JSON.parse(response_body)
        response_json.dig('error', 'message') if response_json.is_a?(Hash)
      rescue JSON::ParserError
        nil
      end
      parsed_message || 'エラーが発生しましたが、エラーメッセージが取得できませんでした。'
    end
  end
end

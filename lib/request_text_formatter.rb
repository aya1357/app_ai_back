module RequestTextFormatter
  def self.sample_request_formatter(text, request)
    "文章の修正に関しての要望は\n#{request}です。以下の文章を適切に修正してください。\n\n#{text}\n"
  end
end

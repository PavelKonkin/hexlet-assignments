# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    request = ::Rack::Request.new(env)
    locale = extract_locale_from_accept_language_header(request)
    I18n.locale = locale
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

private
  def extract_locale_from_accept_language_header(request)
    locale = request.env['HTTP_ACCEPT_LANGUAGE']
    if locale.nil? || locale.empty?
      return I18n.default_locale
    else
      locale.scan(/^[a-z]{2}/).first
    end
  end
  # END
end

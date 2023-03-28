# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    response = Rack::Response.new(body, status, headers)
    body << (Digest::SHA256.hexdigest response.body[0])
    [status, headers, body]
    # END
  end
end

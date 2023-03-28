# frozen_string_literal: true

require 'rack'
class ExecutionTimer
  def initialize(app)
    @app = app
  end
  def call(env)
    status, headers, body = Rack::Runtime.new(@app).call(env)
    body << (headers['X-Runtime'] * 1000000)
    [status, headers, body]
    #status, headers, body = @app.call(env)
    #response = Rack::Response.new(body, status, headers)
    #['', {}, []]
  end
end
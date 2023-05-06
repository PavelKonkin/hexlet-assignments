# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'net/https'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      register_url = 'https://rails-collective-blog-ru.hexlet.app/users/sign_up'
      response = Net::HTTP.get_response(URI(register_url))
      html = Nokogiri::HTML(response.body)
      csrf_token_tag = html.at('meta[name="csrf-token"]')
      auth_token = html.at('input[name="authenticity_token"]')
      cookie = response.response['set-cookie']
      params = { "user[email]": email,
                 "user[password]": password,
                 "user[password_confirmation]": password,
                 'authenticity_token': auth_token[:value] }
      uri = URI('https://rails-collective-blog-ru.hexlet.app/users')
      request = Net::HTTP::Post.new(uri)
      request.body = URI.encode_www_form(params)
      request['Cookie'] = cookie
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.request request
    end  
    # END
  end
end

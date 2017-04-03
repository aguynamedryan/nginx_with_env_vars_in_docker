require_relative '../app'
require 'minitest/autorun'
require 'rack/test'
require 'dotenv'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_env_with_no_env_vars
    get '/env', q: 'VARIABLE'
    refute_match /VARIABLE/, last_response.body
  end

  def test_env_with_dotenv
    Dotenv.load("../.env.local", ".env")
    get '/env', q: 'VARIABLE'
    assert_match /VARIABLE/, last_response.body
  end
end

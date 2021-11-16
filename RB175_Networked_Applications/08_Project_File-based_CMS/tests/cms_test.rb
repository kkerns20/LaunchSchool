ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'minitest/autorun'

require_relative '../cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root
    get '/'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about.txt'
    assert_includes last_response.body, 'changes.txt'
    assert_includes last_response.body, 'history.txt'
  end

  def test_file_page
    get '/history.txt'
    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, '1995 - Ruby 0.95 released.'
  end

  def test_page_dne_redirect
    get '/dne'
    assert_equal 302, last_response.status

    get last_response['Location']

    assert_equal 200, last_response.status
    assert_include "That file does not exist."

    get '/'
    refute_includes last_response.body, 'That file does not exist.'
  end
end
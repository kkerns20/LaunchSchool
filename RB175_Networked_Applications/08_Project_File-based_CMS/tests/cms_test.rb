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
    assert_includes last_response.body, 'about.md'
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
    assert_includes  last_response.body, "dne does not exist."

    get '/'
    refute_includes last_response.body, 'dne does not exist.'
  end

  def test_markdown_document_view
    get '/about.md'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, '<h1>Ruby is...</h1>'
  end

  def test_edit_file
    get '/changes.txt/edit'
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<textarea'
    assert_includes last_response.body, %q(<button type='submit')
  end

  def test_update_file
    post '/changes.txt', content: 'new_content'
    assert_equal 302, last_response.status

    get last_response['Location']
    assert_includes last_response.body, 'changes.txt has been updated'

    get '/changes.txt'
    assert_equal 200, last_response.status
    assert_includes last_response.body 'new content'
  end
end
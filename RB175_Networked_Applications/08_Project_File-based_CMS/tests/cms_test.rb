ENV['RACK_ENV'] = 'test'

require 'fileutils'
require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { 'rack.session' => { user_name: 'admin' } }
  end

  def create_document(name, contents = '')
    File.open(File.join(data_path, name), 'w') do |file|
      file.write(contents)
    end
  end

  def test_index
    create_document 'about.md'
    create_document 'changes.txt'

    get '/'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about.md'
    assert_includes last_response.body, 'changes.txt'
  end

  def test_file_page
    create_document 'history.txt', '1995 - Ruby 0.95 released.'

    get '/history.txt'
    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, '1995 - Ruby 0.95 released.'
  end

  def test_page_dne_redirect
    get '/dne'
    assert_equal 302, last_response.status
    assert_equal "dne does not exist.", session[:message]
  end

  def test_markdown_document_view
    create_document 'about.md', '# Ruby is...'

    get '/about.md'
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, '<h1>Ruby is...</h1>'
  end

  def test_edit_file
    create_document 'changes.txt'

    get '/changes.txt/edit', {}, admin_session
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<textarea'
    assert_includes last_response.body, %q(<button type='submit')
  end

  def test_edit_file_signed_out
    create_document 'changes.txt'

    get '/changes.txt/edit'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_update_file
    post '/changes.txt', { content: 'new content' }, admin_session
    assert_equal 302, last_response.status
    assert_equal 'changes.txt has been updated.', session[:message]

    get '/changes.txt'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'new content'
  end

  def test_update_file_signed_out
    post '/changes.txt', content: 'new content'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_new_document_form
    get '/new', {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, %q(<button type='submit')
  end

  def test_new_document_form_signed_out
    get '/new'

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_create_file
    post '/create', { new_file_name: 'test.txt' }, admin_session
    assert_equal 302, last_response.status
    assert_equal 'test.txt was created.', session[:message]

    get '/'
    assert_includes last_response.body, 'test.txt'
  end

  def test_create_file
    post '/create', new_file_name: 'test.txt'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_nameless_new_file
    post '/create', { new_file_name: '' }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'A name is required.'
  end

  def test_deleting_file
    create_document 'delete_me.txt'

    post '/delete_me.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal 'delete_me.txt has been deleted.', session[:message]

    get '/'
    refute_includes last_response.body, %q(href='/delete_me.txt')
  end

  def test_deleting_file_signed_out
    create_document 'delete_me.txt'

    post '/delete_me.txt/delete'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that.', session[:message]
  end

  def test_sign_in_form
    get '/users/sign_in'
    assert_equal 200, last_response.status
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, %q(<button type='submit')
  end

  def test_sign_in
    post '/users/sign_in', user_name: 'admin', password: 'secret'
    assert_equal 302, last_response.status
    assert_equal 'Welcome!', session[:message]
    assert_equal 'admin', session[:user_name]

    get last_response['Location']
    assert_includes last_response.body, 'Signed in as admin.'
  end

  def test_sign_in_bad_user_name
    post '/users/sign_in', user_name: 'other', password: 'secret'
    assert_equal 422, last_response.status
    assert_nil session[:user_name]
    assert_includes last_response.body, 'Invalid credentials.'
  end

  def test_sign_in_bad_password
    post '/users/sign_in', user_name: 'admin', password: 'other'
    assert_equal 422, last_response.status
    assert_nil session[:user_name]
    assert_includes last_response.body, 'Invalid credentials.'
  end

  def test_sign_out
    get "/", {}, {"rack.session" => { user_name: "admin" } }
    assert_includes last_response.body, 'Signed in as admin.'

    post '/users/sign_out'
    assert_equal 'You have been signed out.', session[:message]

    get last_response['Location']
    assert_nil session[:user_name]
    assert_includes last_response.body, 'Sign In'
  end
end
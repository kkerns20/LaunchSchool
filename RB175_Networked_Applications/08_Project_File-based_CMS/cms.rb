require 'bcrypt'
require 'redcarpet'
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

def render_markdown(string)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(string)
end

def file_contents(file_path)
  file = File.read(file_path)
  case file_path.split('.').last
  when 'txt'
    headers['Content-Type'] = 'text/plain'
    file
  when 'md'
    erb render_markdown(file)
  end
end

def data_path
  if ENV['RACK_ENV'] == 'test'
    File.expand_path('../tests/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

def enforce_sign_in
  return if session[:user_name]

  session[:message] = 'You must be signed in to do that.'
  redirect '/'
end

def load_user_credentials
  credentials_path = if ENV['RACK_ENV'] == 'test'
    File.expand_path('../tests/users.yml', __FILE__)
  else
    File.expand_path('../users.yml', __FILE__)
  end
  YAML.load_file(credentials_path)
end

def valid_credentials?(user_name, password)
  credentials = load_user_credentials

  if credentials.key?(user_name)
    bcrypt_password = BCrypt::Password.new(credentials[user_name])
    bcrypt_password == password
  else
    false
  end
end

get '/' do
  @dir = Dir.glob(File.join(data_path, '*'))
            .map { |file| File.basename(file) }
  erb :index
end

get '/users/sign_in' do
  erb :sign_in
end

post '/users/sign_in' do
  user_name = params[:user_name]

  if valid_credentials?(user_name, params[:password])
    session[:user_name] = user_name
    session[:message] = 'Welcome!'
    redirect '/'
  else
    session[:message] = "Invalid credentials."
    status 422
    erb :sign_in
  end
end

post '/users/sign_out' do
  session.delete(:user_name)
  session[:message] = 'You have been signed out.'
  redirect '/'
end

get '/new' do
  enforce_sign_in

  erb :new
end

get '/:file_name' do
  file_path = File.join(data_path, params[:file_name])

  if !File.file?(file_path)
    session[:message] = "#{params[:file_name]} does not exist."
    redirect '/'
  end

  file_contents(file_path)
end

get '/:file_name/edit' do
  enforce_sign_in

  file_path = File.join(data_path, params[:file_name])

  @file_name = params[:file_name]
  @content = File.read(file_path)

  erb :edit
end

post '/create' do
  enforce_sign_in

  @new_file_name = params[:new_file_name].to_s

  if @new_file_name.empty?
    session[:message] = 'A name is required.'
    status 422
    erb :new
  else
    File.write(File.join(data_path, @new_file_name), '')
    session[:message] = "#{@new_file_name} was created."
    redirect '/'
  end
end

post '/:file_name/delete' do
  enforce_sign_in

  file_name = File.join(data_path, params[:file_name])

  File.delete(file_name)
  session[:message] = "#{params[:file_name]} has been deleted."
  redirect '/'
end

post '/:file_name' do
  enforce_sign_in

  file_path = File.join(data_path, params[:file_name])

  File.write(file_path, params[:content])

  session[:message] = "#{params[:file_name]} has been updated."
  redirect '/'
end

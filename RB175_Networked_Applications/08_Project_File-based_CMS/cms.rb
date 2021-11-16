require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'

DATA_PATH = "#{File.dirname(__FILE__)}/data/".freeze

configure do
  enable :sessions
  set :session_secret, 'super secret'
end

get '/' do
  @dir = Dir.glob("#{DATA_PATH}*")
            .map { |file| File.basename(file) }
  erb :layout
end

get '/:file_name' do
  file_path = DATA_PATH + params[:file_name]

  if File.file?(file_path)
    headers["Content-Type"] = 'text/plain'
    File.read(file_path)
  else
    session[:message] = '$DOCUMENT does not exist.'
    redirect '/'
  end
end
require 'redcarpet'
require 'sinatra'
require 'sinatra/content_for'
require 'sinatra/reloader'
require 'tilt/erubis'

DATA_PATH = "#{File.dirname(__FILE__)}/data/".freeze

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
    headers["Content-Type"] = 'text/plain'
    file
  when 'md'
    render_markdown(file)
  end
end

get '/' do
  @dir = Dir.glob("#{DATA_PATH}*")
            .map { |file| File.basename(file) }
  erb :layout
end

get '/:file_name' do
  file_path = DATA_PATH + params[:file_name]

  if !File.file?(file_path)
    session[:message] = "#{params[:file_name]} does not exist."
    redirect '/'
  end

  file_contents(file_path)
end

get '/:file_name/edit' do
  file_path = DATA_PATH + params[:file_name]

  @file_name = params[:file_name]
  @content = File.read(file_path)

  erb :edit
end

post '/:file_name/edit' do
  file_path = DATA_PATH + params[:file_name]

  File.write(file_path, params[:content])

  session[:message] = "#{params[:file_name]} has been updated."
  redirect '/'
end
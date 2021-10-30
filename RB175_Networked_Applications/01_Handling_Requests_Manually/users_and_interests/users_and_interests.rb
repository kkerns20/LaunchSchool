require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = YAML.load_file('users.yaml')
end

helpers do
  def count_interests
    @users.map { |_, data| data[:interests] }.flatten.size
  end
end

get '/' do
  redirect '/users'
end

get '/users' do
  erb :users
end

get '/:user' do
  @user_name = params[:user].to_sym
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]

  erb :user
end

require 'sinatra/base'

class RPSapp < Sinatra::Base

  enable :sessions

  get '/' do
    'Testing'
    erb :index
  end

  post '/names' do
    @p1_name = params[:player_1_name]
    erb :play
  end

  run! if app_file == $0

end
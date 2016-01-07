get '/' do
  erb :index
end

get '/session' do
  @session = session[:user_id]
  erb :session
end

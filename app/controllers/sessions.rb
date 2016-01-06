get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.find_by(username: params[:login][:username])
  if @user.authenticate(@user.username, @user.password)
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'/users/new'
  end
end

post '/logout' do

end

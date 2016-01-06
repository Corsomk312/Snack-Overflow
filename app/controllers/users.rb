get '/users' do
  @users = User.all
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/users/login'
  end
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  #take info and create new user in database
  @user = @user.create(params[:login])
  if @user.authenticate(@user.username, @user.password)
    session[:user_id] == @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:id' do
  #take user to profile page
end

delete '/users/:id' do
  #delete users
end

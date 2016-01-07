get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  #take info and create new user in database
  @user = User.create(params[:login])
  if @user.authenticate(@user.username, @user.password)
    session[:user_id] == @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:id' do
  #take user to profile page
  if current_user
    erb :'/users/profile'
  else
    redirect '/login'
  end
end

delete '/users/:id' do
  #delete users
end

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
  if @user.authenticate(@user.username, params[:login][:password])
    session[:user_id] == @user.id
    redirect "/users/#{curent_user.id}"
  else
    redirect '/users/new'
  end
end

get '/users/:id' do
  #take user to profile page
  if current_user.id == session[:user_id]
    erb :'/users/profile'
  else
    redirect '/login'
  end
end

delete '/users/:id' do
  #delete users
end

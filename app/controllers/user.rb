#------------------------------GET-------------------------
get '/user/create' do
  erb :create_user
end

get '/user/logout' do
  session[:user_id] = nil
  erb :index
end

get '/user/:user_id/profile' do
  @user = User.find(params[:user_id])
  erb :user_profile
end

#---------------------------------POST------------------------------


post '/user/create' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}/profile"
  else
    @errors = @user.errors.full_messages
    erb :create_user
  end
end

post '/user/signin' do
  @user = User.find_by_email(params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to "/user/#{@user.id}/profile"
  else
    @errors = ["Your username or email doesn't exist."]
    erb :index
  end
end

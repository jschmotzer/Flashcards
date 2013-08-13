get '/' do
  # Look in app/views/index.erb
  if current_user.nil?
    erb :index
  else
    redirect "/user/#{session[:user_id]}/profile"
  end
end

set :protection, except: :session_hijacking

post '/sessions/new' do
  if User.authenticate(params[:username], params[:password])
    user = User.find_by_username(params[:username])
    session[:user_id] = user.id
    redirect to '/profile'
  else
    redirect to '/'
  end
end

get '/profile' do
  if !current_user.nil?
    @surveys_created = current_user.created_surveys
    @surveys_taken = current_user.taken_surveys
    erb :profile
  end
end

get '/signup' do
  @hide_login_form = true
  erb :new
end

post '/users/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect to '/'
end

delete '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
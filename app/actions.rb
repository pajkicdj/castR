# Homepage (Root path)

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end


get '/' do
  erb :index
end


get '/signup' do
  @user = User.new
  erb :signup
end

post '/validate_signup' do
  
  @user = User.new
  @user.email = params[:email]
  @user.name = params[:name]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]

  if @user.save
    session[:user_id] = @user.id
    redirect(to('/'))
  else
    erb(:signup)
  end
end


get '/login' do
  erb(:login)
end


post '/validate_login' do
  name = params[:name]
  password = params[:password]

  user = User.find_by(name: name)

  if user && user.password == password
    session[:user_id] = user.id
    redirect(to('/'))
  else
    @error_message = "Login failed."
    erb(:login)
  end
end


get '/logout' do
  session[:user_id] = nil
  redirect(to('/login'))
end

get '/moods' do
  erb(:'/moods/index')
end























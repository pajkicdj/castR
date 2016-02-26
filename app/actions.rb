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
    redirect(to('/moods'))
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
  @moods = Mood.all
  erb(:'/moods/index')
end


get '/get_started' do
  if current_user
    redirect(to('/moods'))
    # erb(:'/moods/index')
  else
    erb(:login)
  end
end

get '/moods/:id' do
  @mood = Mood.find(params[:id])
  erb :'moods/moodpage'
end

# get '/moods/:mood_id/:id/podcasts.first.id' do
#   @playlist = Playlist.find(params[:id])
#   erb :'moods/playlistpage'
# end


#et '/moods/:mood_id/:id/podcasts.first.id' do

get '/playlists/:id' do
  @playlist = Playlist.find(params[:id])
  #@podcast = Podcast.find(@playlist.first.id)
  erb :'moods/playlistpage'
end


get '/profile' do
  erb :'/users/profile'
end

post '/users/upload_image' do
  #[:filename] is a default key of the name of the file
  @filename = params[:file_data][:filename]
  #[:tempfile] is a default key for the temporary path of the file in the browser
  file = params[:file_data][:tempfile]
  File.open("./public/images/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  user = current_user
  user.image = @filename
  user.save
  redirect "/profile"
end


get '/playlists/:playlist_id/:id' do
  @podcast = Podcast.find(params[:id])
  @playlist1 = Playlist.find(params[:playlist_id]) 
  #@podcast = Podcast.find(@playlist.first.id)
  erb :'moods/podcastpage'
end


post '/likes' do
  music_id = params[:podcast_id]
  like = Like.new(podcast_id: music_id, user_id: current_user.id)
  like.save
  redirect(back)
end

delete '/likes/:id' do
  like = Like.find(params[:id])
  like.destroy
  redirect(back)
end















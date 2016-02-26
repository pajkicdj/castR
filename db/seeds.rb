require 'faker'

# Create main user
@djina = User.create(
  name: "Djina",
  email: "djina@example.com",
  password: "password"
)

@jake = User.create(
  name: "Jake",
  email: "jake@example.com",
  password: "password"
)

@brendan = User.create(
  name: "Brendan",
  email: "brendan@example.com",
  password: "password"
)


#########################################
comedy = Mood.create(
  title: 'Comedy'
)

educational = Mood.create(
  title: 'Educational')

drama = Mood.create(
  title: 'Drama'
)

pop_culture = Mood.create(
  title: 'Pop Culture')

#########################################

title = "Comedy Bang! Bang!"
comedy.playlists.create!(
  title: title,
)


3.times do
  title = Faker::Name.title
  educational.playlists.create!(
    title: title,
  )
end

3.times do
  title = Faker::Name.title
  drama.playlists.create!(
    title: title,
  )
end

3.times do
  title = Faker::Name.title
  pop_culture.playlists.create!(
    title: title,
  )
end
########################################
[*1..12].each { |num|
  3.times do
    title = Faker::Name.title
    playlist_id = num
    slug = Faker::Internet.slug("#{title}")
    Podcast.create!(
      title: title,
      playlist_id: playlist_id,
      url: Faker::Internet.url('example.com', "/#{slug}")
    )
  end
}

########################################
3.times do
  podcast_id = Faker::Number.between(1, 36)
  @brendan.likes.create!(
    user_id: @brendan.id,
    podcast_id: podcast_id
  )
end

3.times do
  podcast_id = Faker::Number.between(1, 36)
  @jake.likes.create!(
    user_id: @jake.id,
    podcast_id: podcast_id
  )
end

3.times do
  podcast_id = Faker::Number.between(1, 36)
  @djina.likes.create!(
    user_id: @djina.id,
    podcast_id: podcast_id
  )
end













require "faker"

User.destroy_all

(1..10).each do |id |
    User.create!(
        #id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email
    )
end
puts "#{User.count}users created"


Channel.destroy_all

(1..5).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Creature::Cat.breed
    )
end

(1..5).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Music.band
    )
end

(1..5).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Game.title
    )
end

(1..5).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Movie.title
    )
end

puts "#{Channel.count}channels created"

Post.destroy_all

(1..20).each do |id|
    Post.create!(
        #id: id,
        user_id: rand(1..10),
        channel_id: rand(1..20),
        content: Faker::Lorem.paragraph(sentence_count: 3)
    )
end

puts "#{Post.count}comments created"

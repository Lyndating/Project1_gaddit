require "faker"

Post.destroy_all
Channel.destroy_all
User.destroy_all




(1..10).each do |id |
    User.create!(
        #id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "chicken"
        avatar: "https://res.cloudinary.com/dgpwctfjt/image/upload/v1649905020/spn0au6q3kndekxbkpg0.png"
    )
end
puts "#{User.count}users created"




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


User.all.each do |user|
    Channel.all.each do |channel|
        (1..15).each do |id|
            Post.create!(
            #id: id,
                title: Faker::Lorem.sentence(word_count: 5),
                user_id: User.all.ids.sample,
                channel_id: Channel.all.ids.sample,
                content: Faker::Lorem.paragraph_by_chars(number:256, supplemental: false)
            )
        end
    end
end

puts "#{Post.count}posts created"

User.all.each do |user|
    user.channels << Channel.all.shuffle.take(5)
end

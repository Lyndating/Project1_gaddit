require "faker"

Post.destroy_all
Channel.destroy_all
User.destroy_all




(1..10).each do |id |
    User.create!(
        #id: id,
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "chicken",
        avatar: "https://res.cloudinary.com/dgpwctfjt/image/upload/v1649905020/spn0au6q3kndekxbkpg0.png",
    )
end
puts "#{User.count}users created"




(1..10).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Creature::Cat.breed
    )
end

(1..10).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Music.band
    )
end

(1..10).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Game.title
    )
end

(1..10).each do |id|
    Channel.create!(
        #id: id,
        name: Faker::Movie.title
    )
end

puts "#{Channel.count}channels created"

User.all.each do |user|
    user.channels << Channel.all.shuffle.take(5)
end

User.all.each do |user|
    user.channels.shuffle.take(8).each do |channel|
        (1..10).each do |id|
            post = Post.create!(
            #id: id,
                title: Faker::Lorem.sentence(word_count: 5),
                user_id: User.all.ids.sample,
                channel_id: Channel.all.ids.sample,
                content: Faker::Lorem.paragraph_by_chars(number:256, supplemental: false)
            )
            (1..5).each do |id|
                Comment.create!(
                    content: Faker::Lorem.sentence(word_count:5),
                    user_id: User.all.ids.sample,
                    post_id: post.id,
                )
            end
        end
    end
end   

puts "#{Post.count}posts created"

puts "#{Comment.count} comments created"



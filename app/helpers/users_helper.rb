module UsersHelper
    def avatar_for (user)
        avatar_id = Digest::MD5::hexdigest(user.email.downcase)
        avatar_list = ["/avatars/G-1.png","/avatars/G-2.png","/avatars/G-3.png"]
        avatar_url = avatar_list.sample
        image_tag(avatar_url, alt: user.name, class:"avatar")
    end
end

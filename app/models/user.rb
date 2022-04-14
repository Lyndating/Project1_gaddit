class User < ApplicationRecord
    before_save {self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, :uniqueness => true, :presence => true, :length => {maximum: 255}, :format => {with: VALID_EMAIL_REGEX }
    validates :name, :presence => true, :length => {maximum: 50}
    validates :avatar, :presence => true
   
    has_secure_password

    has_and_belongs_to_many :channels
    has_many :posts, dependent: :destroy 
    has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship",
    foreign_key: "followed_id", dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    # Follows a user
    def follow(other_user)
        active_relationships.create(followed_id: other_user.id)
    end

    # Unfollows a user
    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    # returns true if the current user is following the other user.
    def following?(other_user)
        following.include?(other_user)
    end

end

class User < ApplicationRecord
    before_save {self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, :uniqueness => true, :presence => true, :length => {maximum: 255}, :format => {with: VALID_EMAIL_REGEX }
    validates :name, :presence => true, :length => {maximum: 50}
   
    has_secure_password
    validates :password, :presence => true, :length=> {minimum: 6}
    has_and_belongs_to_many :channel
    has_many :post  

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
end

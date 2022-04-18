class User < ApplicationRecord
    include RememberMe::Model
    validates :email, :uniqueness => true, :presence => true, :length => {maximum: 255}, :format => {with: URI::MailTo::EMAIL_REGEXP }
    validates :name, :presence => true, :length => {maximum: 50}
    validates :avatar, :presence => true
   
    has_secure_password

    has_and_belongs_to_many :channels
    has_many :posts, dependent: :destroy 
    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

end

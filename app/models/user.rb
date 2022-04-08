class User < ApplicationRecord
    validates :email, :uniqueness => true, :presence => true
    has_secure_password
    # has_and_belongs_to_many :channel
    has_many :post
end

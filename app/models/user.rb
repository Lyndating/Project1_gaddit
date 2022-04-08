class User < ApplicationRecord
    # has_and_belongs_to_many :channel
    has_many :post
end

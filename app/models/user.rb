class User < ApplicationRecord
    has_and belongs_to_many :channel
    has_many :post
end

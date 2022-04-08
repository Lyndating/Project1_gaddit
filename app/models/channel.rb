class Channel < ApplicationRecord
    has_many :post
    # has_and_belongs_to_many :users
end

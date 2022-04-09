class Post < ApplicationRecord
    belongs_to :channel, :optional => true
    belongs_to :user
    validates :user_id, presence: true
    validates :content, presence: true
end

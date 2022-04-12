class Post < ApplicationRecord
    belongs_to :channel, :optional => true
    belongs_to :user, :optional => true
    validates :user_id, presence: true
    validates :content, presence: true
    default_scope -> {order(created_at: :desc)}
end

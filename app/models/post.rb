class Post < ApplicationRecord
    belongs_to :channel, :optional => true
    belongs_to :user, :optional => true
    default_scope -> {order(created_at: :desc)}
end

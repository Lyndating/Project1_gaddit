class Post < ApplicationRecord
    belongs_to :channel, :optional => true
    
end


class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes
    after_save :update_post_counter

    def update_post_counter
        author.increment!()
    end
end
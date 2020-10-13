class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def total_likes
        self.posts.map {|post| post.likes}.sum
    end

    def featured_post
        posts = {}
        self.posts.each do |post|
            posts[post.id] = post.likes
        end
        self.posts.find(posts.key(posts.values.max))
    end

end

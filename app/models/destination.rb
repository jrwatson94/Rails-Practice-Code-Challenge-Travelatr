class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_destination
        destinations = {}
        self.posts.each do |post|
            destinations[post.id] = post.likes
        end
        self.posts.find(destinations.key(destinations.values.max))
    end

    def recent_posts
        self.posts.order(:created_at).limit(5)
    end

    def average_age
        (self.bloggers.uniq.map {|blogger| blogger.age}.sum)/(self.bloggers.uniq.count)
    end

end

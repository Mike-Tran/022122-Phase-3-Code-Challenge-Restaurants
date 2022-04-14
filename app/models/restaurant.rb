class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.fanciest
        Restaurant.all.max_by &:price
    end

    def all_reviews
        self.reviews.map &:full_review
    end
end
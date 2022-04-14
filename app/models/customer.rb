require 'pry'
class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def favorite_restuarant
        self.reviews.order(:star_rating).last.restaurant
    end

    def add_review(restaurant, rating)
        Review.create(
            star_rating: rating,
            restaurant_id: restaurant.id,
            customer_id: self.id
        )
    end

    def delete_reviews(restaurant)
        self.reviews.where(restaurant: restaurant).destroy_all
    end
end
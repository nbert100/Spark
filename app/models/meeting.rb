class Meeting < ApplicationRecord
    validates :venue, :location, :appointment, presence: true
    belongs_to :user
    belongs_to :suitor
    validates :suitor_id, presence: true
    validates_associated :suitor 
    accepts_nested_attributes_for :suitor

    
    def self.order_venue
        order("venue desc")
    end

    def self.most_recent
        order("appointment desc")
    end

    def self.highest_rated
        order("rating desc")
    end

    def self.average_rating
        average(:rating)
    end

    scope :restaurant, -> {where(venue: "Restaurant")}
    scope :coffee_shop, -> {where(venue: "Coffee Shop")}
    scope :bar, -> {where(venue: "Bar")}
    scope :other, -> {where(venue: "Other")}

    scope :fancy_date, -> {where(dating_app: "Raya")}
end

class Meeting < ApplicationRecord
    validates :venue, :location, :appointment, presence: true
    belongs_to :user
    belongs_to :suitor
    validates :suitor_id, presence: true
    validates_associated :suitor 
    accepts_nested_attributes_for :suitor

    
    def self.most_recent
        order("appointment desc")
    end

    def self.highest_rated
        order("rating desc")
    end

    def self.average_rating
        average(:rating)
    end

    def self.by_suitor(suitor_id)
        where(suitor: suitor_id)
    end

    
end

class Meeting < ApplicationRecord
    
    belongs_to :user
    belongs_to :suitor
    validates :venue, :location, :appointment, presence: true
    #accepts_nested_attributes_for :suitor
    validates :suitor, presence: true
    validates_associated :suitor 
    
    def suitor_attributes=(attributes)
        suitor = Suitor.find_or_create_by(attributes)
        # binding.pry
        self.suitor = suitor if suitor.valid? || !self.suitor
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

    def self.by_suitor(suitor_id)
        where(suitor: suitor_id)
    end

    
end

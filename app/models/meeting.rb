class Meeting < ApplicationRecord
    validates :venue, :location, :appointment, presence: true
    belongs_to :user
    belongs_to :suitor, optional: true
    validates :suitor_id, presence: true
    validates_associated :suitor 
    #custom validation for duplication
    
    def suitor_attributes=(attributes)
        
        suitor = Suitor.find_or_create_by(attributes)
        # self.suitor = suitor if suitor.present?
        self.suitor = suitor if suitor.valid? || !self.suitor
    end

    # def duplicate
    #     if Suitor.find_by(name: name, hometown: hometown, age: age)
    #         errors << "This suitor already exists."
    #     end
    # end

    #scope :restaurant, -> {where(venue: 'Restaurant')}

    # def self.at_restaurant
    #     where("venue = restaurant")
    # end

   # scope :coffee_shop, -> {where("venue = ?", Coffee Shop)}
    
#    def self.venue(venue)
#         where("venue == ?", venue)
#     end

    def self.order_venue
        order("venue desc")
    end

    def self.most_recent
        order("appointment desc")
    end

end

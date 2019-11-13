class Meeting < ApplicationRecord
    validates :venue, :location, :appointment, presence: true
    belongs_to :user
    belongs_to :suitor
    validates :suitor_id, presence: true
    validates_associated :suitor 
    accepts_nested_attributes_for :suitor

    # def suitor_attributes(attrs)
    #     attrs.values.each do |a|
    #         if attr
    # end
    
    def self.order_venue
        order("venue desc")
    end

    def self.most_recent
        order("appointment desc")
    end

end

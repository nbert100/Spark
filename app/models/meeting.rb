class Meeting < ApplicationRecord
    validates :venue, :location, :appointment, presence: true
    belongs_to :user
    belongs_to :suitor, optional: true
    #accepts_nested_attributes_for :suitor
    #custom validation for duplication
    def suitor_attributes=(attributes)
        Suitor.find_or_create_by(attributes)
        self.suitor = suitor if suitor.valid? ||!self.suitor
    end

    # def duplicate
    #     if Suitor.find_by(name: name, hometown: hometown, age: age)
    #         errors << "This suitor already exists."
    #     end
    # end

end

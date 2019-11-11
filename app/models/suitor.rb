class Suitor < ApplicationRecord

    validates :name, :age, :dating_app, :hometown, presence: true
    validates :name, uniqueness: true
    has_many :meetings
    has_many :users, through: :meetings
    

    def suitor_description
        "#{self.name}, #{self.age} - #{self.hometown}"
    end
    

    def self.older_than(age)
         where("age < ?", age)
    end

    def self.younger_than(age)
        where("age < ?", age)
    end

    #does this work?
    def self.by_dating_app(app)
        where("dating_app = ?", app)
    end
end
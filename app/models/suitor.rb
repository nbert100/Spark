class Suitor < ApplicationRecord

    validates :name, :age, :dating_app, :hometown, presence: true
    #validate :name, :age, :hometown, uniqueness: true
    validate :no_duplicate
    has_many :meetings
    has_many :users, through: :meetings
    

    def no_duplicate
        if self.find_by(name: name, age: age, hometown: hometown)
            errors.add(:name, "This suitor already exists")
        end
    end

    def suitor_description
        "#{self.name}, #{self.age} - #{self.hometown}"
    end
    # def self.sort_by_age
    #     order(age: :desc)
    # end

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
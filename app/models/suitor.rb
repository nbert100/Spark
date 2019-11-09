class Suitor < ApplicationRecord

    validates :name, :age, :dating_app, :hometown, presence: true
    #validates :name, :age, :hometown, uniqueness: true
    has_many :meetings
    has_many :users, through: :meetings
    

       # def no_duplicate_suitor
    #     @suitor.name && @suitor.age && @suitor.hometown
    # end

    # def self.sort_by_age
    #     order(age: :desc)
    # end

    def self.older_than(age)
         where("age < ?", age)
    end

    def self.younger_than(age)
        where("age < ?", age)
    end

    def self.by_dating_app(dating_app)
        where("dating_app = ?", dating_app)
    end
end
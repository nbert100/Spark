class Suitor < ApplicationRecord

    validates :name, :age, :dating_app, :hometown, presence: true
    validates :name, uniqueness: true
    #scope method
    #scope :sort_by_age, -> {order(:age)}
    has_many :meetings
    has_many :users, through: :meetings

    def self.sort_by_age
        order(age: :desc)
    end
end
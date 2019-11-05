class Suitor < ApplicationRecord
    validates :name, :age, presence: true
end
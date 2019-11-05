class Meeting < ApplicationRecord
    belongs_to :user
    belongs_to :suitor, optional: true
end

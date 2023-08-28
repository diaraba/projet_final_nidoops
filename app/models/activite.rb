class Activite < ApplicationRecord
    validates :name, presence: true
    validates :name, length: {maximum: 250}

    has_and_belongs_to_many :structures
    has_and_belongs_to_many :users
end

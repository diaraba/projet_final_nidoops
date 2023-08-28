class ProfileUser < ApplicationRecord
    validates :nom, :prenom,:genre,:situation,:numero, presence: true
    validates :nom, :prenom,:genre,:situation,:numero, length: {maximum: 250}

    belongs_to :user
    has_one_attached :image
end

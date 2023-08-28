class ProfileStructure < ApplicationRecord
    validates :name, :description,:purpose,:condition,:structure_id, presence: true
    validates :name,:purpose,:localisation,:slogan,:condition, length: {maximum: 250}

    belongs_to :structure
    has_one_attached :image
end

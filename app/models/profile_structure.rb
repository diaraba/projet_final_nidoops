class ProfileStructure < ApplicationRecord
    belongs_to :structure
    has_one_attached :image
end

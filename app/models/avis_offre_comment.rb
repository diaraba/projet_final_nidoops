class AvisOffreComment < ApplicationRecord
    belongs_to :avis_offre
    belongs_to :user
end

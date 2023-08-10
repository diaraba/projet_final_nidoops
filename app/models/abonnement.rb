class Abonnement < ApplicationRecord
    belongs_to :utilisateur
    belongs_to :structure
end
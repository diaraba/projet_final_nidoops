class Abonnement < ApplicationRecord
    validates :structure_id, numericality: { only_integer: true }
    validates :user_id, numericality: { only_integer: true }
    validates :user_id, presence: true
    validates :structure_id, presence: true

    belongs_to :user
    belongs_to :structure
    scope :specific_abonnement_first, ->(user_id, structure_id) do
        where(user_id: user_id, structure_id: structure_id).first
    end

    scope :specific_abonnement, ->(user_id, structure_id) do
        where(user_id: user_id, structure_id: structure_id)
    end
end
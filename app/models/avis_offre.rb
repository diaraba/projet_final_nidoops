class AvisOffre < ApplicationRecord
    has_many :avis_offre_comments, dependent: :destroy
    belongs_to :structure
    has_one_attached :image

    scope :latest_by_structure_with_matching_activites, ->(user) do
        matching_structure_ids = Structure.joins(:activites_structures)
                                           .where("activites_structures.activite_id IN (?)", user.activite_ids)
                                           .pluck(:id)
      
        joins(:structure)
          .where(structure_id: matching_structure_ids)
          .order(created_at: :desc)
          .limit(3)
    end

    scope :latest_avis_offre, -> {
        order(created_at: :desc)
        .limit(10)
    }
end

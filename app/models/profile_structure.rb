class ProfileStructure < ApplicationRecord
    validates :name, :description,:localisation,:slogan,:statut,:numero,:structure_id, presence: true
    validates :name,:localisation,:slogan,:statut,:numero, length: {maximum: 250}
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  , message: " N'est pas une adresse email" }


    belongs_to :structure
    has_one_attached :image
end

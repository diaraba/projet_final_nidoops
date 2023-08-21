class User < ApplicationRecord
  has_many :annonce_comments, dependent: :destroy
  has_many :avis_offre_comments, dependent: :destroy
  has_one :profile_user
  has_and_belongs_to_many :activites
  has_many :abonnements, dependent: :destroy
  has_many :structures, through: :abonnements 
  enum role: { utilisateur: 0, structure: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  scope :subscribed, ->(user_id, structure_id) do
    joins(:abonnements)
      .where(id: user_id, abonnements: { structure_id: structure_id })
      .exists?
  end

  def est_abonner(structure_id)
    structures = current_user.structures
    structure = Structure.find(structure_id)
  
    for value in structures do
      if value.eql?(structure)
        return true
      end
    end
  
    false
  end
  
end

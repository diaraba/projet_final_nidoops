class Structure < ApplicationRecord
  has_and_belongs_to_many :activites
  has_one :profile_structure
  has_many :annonces
  has_many :avis_offres
  has_many :abonnements, dependent: :destroy
  has_many :users, through: :abonnements 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  scope :with_same_activites_as_user, ->(user) do
    joins(:activites).where(activites: { id: user.activites.pluck(:id) }).distinct
  end       
end

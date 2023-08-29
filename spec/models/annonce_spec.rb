require 'rails_helper'

RSpec.describe Annonce, type: :model do
  describe "Validation" do
    it "Si aucune Structure n'a été attribuer à l'annonce, la Validation de la tâche est invalide." do

      annonce = Annonce.new(title: "annonce_title", description:"annonce_description", purpose:"annonce_purpose", structure_id:nil)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Structure can't be blank", "Structure must exist"]
    end


    it "Si le titre et l'objet est trop long, la Validation de la tâche est invalide." do
      structure = Structure.create!(
        alias: 'Structure',
        email: 'structure@example.com',
        password: 'password',
        password_confirmation: 'password',
      )
      annonce = Annonce.new(title: "annonce_title annonce_title annonce_title annonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_title", description:"annonce_description", purpose:"annonce_purpose", structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Title is too long (maximum is 250 characters)"]
    end
  end

end

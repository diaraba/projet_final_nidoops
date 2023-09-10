require 'rails_helper'

RSpec.describe Annonce, type: :model do
  describe "Validation" do
    it "Si aucune Structure n'a été attribuer à l'annonce, la Validation de la tâche est invalide." do

      annonce = Annonce.new(title: "annonce_title", description:"annonce_description", purpose:"annonce_purpose", structure_id:nil)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Structure can't be blank", "Structure must exist"]
    end

    it "Si aucune titre n'a été attribuer à l'annonce, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)

      annonce = Annonce.new(title: nil, description:"annonce_description", purpose:"annonce_purpose", structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Title can't be blank"]
    end


    it "Si aucune description n'a été attribuer à l'annonce, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)

      annonce = Annonce.new(title: "annonce_title", description:nil, purpose:"annonce_purpose", structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Description can't be blank"]
    end

    it "Si aucune purpose n'a été attribuer à l'annonce, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)

      annonce = Annonce.new(title: "annonce_title", description:"annonce_description", purpose:nil, structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Purpose can't be blank"]
    end

    it "Si le titre  est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      annonce = Annonce.new(title: "annonce_title annonce_title annonce_title annonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_titleannonce_title", description:"annonce_description", purpose:"annonce_purpose", structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Title is too long (maximum is 250 characters)"]
    end


    it "Si l'objet est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      annonce = Annonce.new(title: "annonce_title ", description:"annonce_description", purpose:"annonce_purpose  annonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purposeannonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  annonce_purpose  ", structure_id:structure.id)
      expect(annonce).to be_invalid
      expect(annonce.errors.full_messages).to eq ["Purpose is too long (maximum is 250 characters)"]
    end
  end

end

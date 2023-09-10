require 'rails_helper'

RSpec.describe AvisOffre, type: :model do
  describe "Validation" do
    it "Si aucune Structure n'a été attribuer à l'avis_offre, la Validation de la tâche est invalide." do

      avis_offre = AvisOffre.new(title: "avis_offre_title", description:"avis_offre_description", condition:"avis_offre_condition", purpose:"avis_offre_purpose", structure_id:nil)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Structure can't be blank", "Structure must exist"]
    end


    it "Si aucune titre n'a été spécifier pour l'avis_offre, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: nil, description:"avis_offre_description", condition:"avis_offre_condition", purpose:"avis_offre_purpose", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Title can't be blank"]
    end

    it "Si aucune description n'a été spécifier pour l'avis_offre, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "title_avis_offre", description:nil, condition:"avis_offre_condition", purpose:"avis_offre_purpose", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Description can't be blank"]
    end

    it "Si aucune condition n'a été spécifier pour l'avis_offre, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "title_avis_offre", description:"descripition_avis_offre", condition:nil, purpose:"avis_offre_purpose", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Condition can't be blank"]
    end

    it "Si aucune purpose n'a été spécifier pour l'avis_offre, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "title_avis_offre", description:"descripition_avis_offre", condition:"avis_offre_condition", purpose:nil, structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Purpose can't be blank"]
    end

    it "Si le titre  est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "avis_offre_title avis_offre_title avis_offre_title avis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_titleavis_offre_title", description:"avis_offre_description", condition:"avis_offre_condition",purpose:"avis_offre_purpose", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Title is too long (maximum is 250 characters)"]
    end


    it "Si l'objet est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "avis_offre_title ", description:"avis_offre_description", condition:"avis_offre_condition",purpose:"avis_offre_purpose  avis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purposeavis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  avis_offre_purpose  ", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Purpose is too long (maximum is 250 characters)"]
    end


    it "Si la condition est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      avis_offre = AvisOffre.new(title: "avis_offre_title ", description:"avis_offre_description", condition:"avis_offre_condition avis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_conditionavis_offre_condition ",purpose:"avis_offre_purpose ", structure_id:structure.id)
      expect(avis_offre).to be_invalid
      expect(avis_offre.errors.full_messages).to eq ["Condition is too long (maximum is 250 characters)"]
    end
  end
end

require 'rails_helper'

RSpec.describe ProfileStructure, type: :model do
  describe "Validation" do
    it "Si aucune Structure n'a été attribuer à l'profile_structure, la Validation de la tâche est invalide." do

      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:nil)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Structure can't be blank", "Structure must exist"]
    end



    it "Si aucun nom n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: nil, email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Name can't be blank"]
    end

    it "Si aucune description n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:nil, localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Description can't be blank"]
    end

    it "Si aucune localisation n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:nil, slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Localisation can't be blank"]
    end

    it "Si aucun slogan n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_localisation", slogan:nil,statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Slogan can't be blank"]
    end

    it "Si aucun statut n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_localisation", slogan:"profile_structure_slogan",statut:nil,numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Statut can't be blank"]
    end


    it "Si aucun numero n'a été spécifier pour le profile_structure, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_localisation", slogan:"profile_structure_slogan",statut:"profile_structure_statut",numero: nil, structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Numero can't be blank"]
    end


    it "Si le nom  est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Name is too long (maximum is 250 characters)"]
    end


    it "Si localisation est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_conditionprofile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Localisation is too long (maximum is 250 characters)"]
    end


    it "Si le slogan est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com",description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Slogan is too long (maximum is 250 characters)"]
    end
 
    

    it "Si la statut est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purposeprofile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Statut is too long (maximum is 250 characters)"]
    end
     
    it "Si la numero est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "name@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39 78 20 40 39 78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  78 20 40 39  ", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Numero is too long (maximum is 250 characters)"]
    end
         

    it "Si l'email est trop long, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename@gmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Email is too long (maximum is 255 characters)"]
    end

    it "Si l'email n'est pas bon, la Validation de la tâche est invalide." do
      structure = FactoryBot.create(:structure)
      profile_structure = ProfileStructure.new(name: "name", email: "namegmail.com" ,description:"profile_structure_description", localisation:"profile_structure_condition", slogan:"profile_structure_purpose",statut:"profile_structure_purpose",numero: "+223 78 20 40 39  ", structure_id:structure.id)
      expect(profile_structure).to be_invalid
      expect(profile_structure.errors.full_messages).to eq ["Email  N'est pas une adresse email"]
    end
  end
end

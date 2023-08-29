require 'rails_helper'

RSpec.describe Activite, type: :model do
  describe "Validation" do
    it "Si aucun Name n'est saisi, la Validation de la tâche est invalide." do
      activite = Activite.new(name: nil)
      expect(activite).to be_invalid
      expect(activite.errors.full_messages).to eq ["Name can't be blank"]
    end
  end
end

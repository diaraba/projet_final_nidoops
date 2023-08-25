class StructuresController < ApplicationController
    before_action :set_structure, only: %i[ show annonces avis_offres subscribers destroy]

    # GET /structures or /structures.json 
    def index
      @structures = Structure.all
    end

    # GET /structures or /structures.json
    def annonces
        @annonces = @structure.annonces 
    end

    # GET /structures or /structures.json
    def avis_offres
        @avis_offres = @structure.avis_offres 
    end
  
    # GET /structures or /structures.json
    def subscribers
      @subscribers = @structure.users 
    end

    # GET /structures/1 or /structures/1.json
    def show
      @abonnement = @structure.abonnements.build
        if user_signed_in?
          @abonnement1 = Abonnement.specific_abonnement_first(current_user.id ,@structure.id)
        end
      end
    
  


    def destroy
      @structure.destroy

      respond_to do |format|
        format.html { redirect_to structures_url, notice: "Annonce was successfully destroyed." }
        format.json { head :no_content }
      end
    end 
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_structure
        @structure = Structure.find(params[:id])
      end
    
  
end

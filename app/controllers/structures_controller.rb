class StructuresController < ApplicationController
    before_action :set_structure, only: %i[ show annonces avis_offres subscribers destroy]
 

    # GET /structures or /structures.json 
    def index
      @q = Structure.ransack(params[:q])
      @structures = @q.result(distinct: true).page(params[:page]).per(3)
    end

    # GET /structures or /structures.json
    def annonces
        @annonces = @structure.annonces.page(params[:page])  
    end

    # GET /structures or /structures.json
    def avis_offres
        @avis_offres = @structure.avis_offres.page(params[:page])  
    end


    def destroy
      @structure = Structure.find(params[:id])
      @structure.destroy

      if @structure.destroy
        redirect_to structures_path, notice: 'Structure was successfully deleted.'
      else
        redirect_to structures_path, alert: 'Failed to delete structure.'
      end
    end
  
    # GET /structures or /structures.json
    def subscribers
      @subscribers = @structure.users.page(params[:page])  
    end

    # GET /structures/1 or /structures/1.json
    def show
      @abonnement = @structure.abonnements.build
        if user_signed_in?
          @abonnement1 = Abonnement.specific_abonnement_first(current_user.id ,@structure.id)
        end
    end
    
  



  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_structure
        @structure = Structure.find(params[:id])
      end
    
  
end

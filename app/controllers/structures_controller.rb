class StructuresController < ApplicationController
    before_action :set_blog, only: %i[ show annonces avis_offres subscribers]

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

      @abonnement1 = Abonnement.specific_abonnement_first(current_user.id ,@structure.id)
    end
    
  
    # PATCH/PUT /blogs/1 or /blogs/1.json
    def update_profile
      respond_to do |format|
        if @annonce.update(blog_params)
          format.html { redirect_to annonce_url(@annonce), notice: "Annonce was successfully updated." }
          format.json { render :show, status: :ok, location: @annonce }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @annonce.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @structure = Structure.find(params[:id])
      end
    
  
end

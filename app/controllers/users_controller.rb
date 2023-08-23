class UsersController < ApplicationController
    before_action :set_user, only: %i[ structures a_la_une_for_user destroy]

    def structures
      @structures = @user.structures
    end  

    def a_la_une_for_user
      @annonces = Annonce.latest_by_structure_with_matching_activites(@user)
      @avis_offres = AvisOffre.latest_by_structure_with_matching_activites(@user)
    end  

    # GET /structures or /structures.json 
    def index
      @users = User.all
    end

    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url, notice: "Annonce was successfully destroyed." }
        format.json { head :no_content }
      end
    end 
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
end

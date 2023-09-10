class UsersController < ApplicationController
    before_action :set_user, only: %i[ structures a_la_une_for_user destroy]

    def structures
      @structures = @user.structures.page(params[:page])
    end  

    def a_la_une_for_user
      @annonces = Annonce.latest_by_structure_with_matching_activites(@user).page(params[:page])
      @avis_offres = AvisOffre.latest_by_structure_with_matching_activites(@user).page(params[:page])
    end  

    # GET /structures or /structures.json 
    def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).page(params[:page])
    end

    def show
      # Ajoutez le code nécessaire pour gérer l'action show ici
      # Par exemple, si vous souhaitez afficher les détails d'un utilisateur
      redirect_to root_path
    end

    def destroy
      @user.destroy

      respond_to do |format|
        format.html { redirect_to users_url, notice: "Annonce was successfully destroyed." }
        format.json { head :no_content }
      end
    end 

    def update_admin
      @user = User.find(params[:id])
      @user.update(admin: !@user.admin)
      redirect_to users_path, notice: 'Admin status updated successfully.'
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
end

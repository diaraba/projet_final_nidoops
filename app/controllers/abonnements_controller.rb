class AbonnementsController < ApplicationController
    before_action :set_abonnement, only: %i[ destroy ]
    before_action :set_structure, only: %i[ show edit  destroy ]




  # POST /abonnements or /abonnements.json
  def create
    @abonnement = Abonnement.new(abonnement_params)

    respond_to do |format|
      if @abonnement.save
        format.html { redirect_to structure_url(@structure), notice: "abonnement was successfully created." }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @abonnement.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /abonnements/1 or /abonnements/1.json
  def destroy
    @abonnement.destroy

    respond_to do |format|
      format.html { redirect_to structure_url(@structure), notice: "abonnement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abonnement
      @abonnement = Abonnement.find(params[:id])
    end

    def set_structure
        @structure = Structure.find(params[:structure_id])
    end

    # Only allow a list of trusted parameters through.
    def abonnement_params
      params.require(:abonnement).permit( :structure_id, :user_id)
    end
end

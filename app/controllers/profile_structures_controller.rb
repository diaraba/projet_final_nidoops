class ProfileStructuresController < ApplicationController
    before_action :set_structure, only: %i[ show ]
    before_action :set_profile, only: %i[ destroy edit update]

    def new
      @profile_structure = ProfileStructure.new
    end  

    def show
        @profile_structure = @structure.profile_structure
    end

    def edit
    end  

    def update
      
      respond_to do |format|
        if @profile_structure.update(profile_params)
          format.html { redirect_to accueils_path, notice: "Profile structure was successfully updated." }
          format.json { render :show, status: :created, location: @profile_structure }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @profile_structure.errors, status: :unprocessable_entity }
        end
      end
    end


    def create
      @profile_structure = ProfileStructure.new(profile_params)
  
      respond_to do |format|
        if @profile_structure.save
          format.html { redirect_to accueils_path, notice: "Profile structure was successfully created." }
          format.json { render :show, status: :created, location: @profile_structure }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @profile_structure.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @profile_structure.destroy

      respond_to do |format|
        format.html { redirect_to profile_structure_url(@profile_structure), notice: "Annonce was successfully destroyed." }
        format.json { head :no_content }
      end
    end 

    private
      def set_structure
        @structure = Structure.find(params[:id]) 
      end  

      def set_profile
        @profile_structure = ProfileStructure.find(params[:id]) 
      end 

      def profile_params
        params.require(:profile_structure).permit(:name, :description, :localisation, :slogan, :statut, :numero, :email, :structure_id, :image)
      end
end

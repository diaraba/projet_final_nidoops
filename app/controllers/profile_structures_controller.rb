class ProfileStructuresController < ApplicationController
    before_action :set_profile, only: %i[ show  edit update ]

    def new
      @profile_structure = ProfileStructure.new
    end  

    def show
        @profile_structure = @structure.profile_structure
    end

    def edit
        @profile_structure = @structure.profile_structure
    end  

    def update
      @profile_structure = @structure.profile_structure
      respond_to do |format|
        if @profile_structure.update(profile_params)
          format.html { redirect_to profile_structure_url(@profile_structure), notice: "Profile structure was successfully created." }
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
          format.html { redirect_to profile_structure_url(@profile_structure), notice: "Profile structure was successfully created." }
          format.json { render :show, status: :created, location: @profile_structure }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @profile_structure.errors, status: :unprocessable_entity }
        end
      end
    end


    private
      def set_profile
        @structure = Structure.find(params[:id]) 
      end  

      def profile_params
        params.require(:profile_structure).permit(:name, :description, :localisation, :slogan, :statut, :numero, :email, :structure_id, :image)
      end
end

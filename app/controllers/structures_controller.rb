class StructuresController < ApplicationController
  def new
    @structure = Structure.new
  end

  def create
    @structure = Structure.new(structure_params)
    @structure.role = :structure # Définir le rôle comme structure
    if @structure.save
      sign_in(@structure)
      redirect_to root_path, notice: "Structure créée avec succès."
    else
      render :new
    end
  end

  private

  def structure_params
    params.require(:structure).permit(:alias, :email, :password, :password_confirmation)
  end
end

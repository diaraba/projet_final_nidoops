class UtilisateursController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    @utilisateur.role = :utilisateur # Définir le rôle comme utilisateur
    if @utilisateur.save
      sign_in(@utilisateur)
      redirect_to root_path, notice: "Utilisateur créé avec succès."
    else
      render :new
    end
  end

  private

  def utilisateur_params
    params.require(:utilisateur).permit(:name, :email, :password, :password_confirmation)
  end
end

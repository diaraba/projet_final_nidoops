class Structures::SessionsController < Devise::SessionsController
    def destroy
        super
    end

    def new_guest
        structure = Structure.find_or_create_by(email: 'pacepep@gmail.com') do |structure|
        structure.password = SecureRandom.hex(10)
        structure.password_confirmation = structure.password
        structure.alias = 'PACEPEP'
        activites_ids = [1, 2, 3] # IDs des activités préférées de l'utilisateur
        structure.activites << Activite.where(id: activites_ids)
        structure.skip_confirmation!
        end
        sign_in structure
        redirect_to root_path, notice: "Connecté(e) en tant que structure invité !"
    end
end

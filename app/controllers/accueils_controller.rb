class AccueilsController < ApplicationController

    def index
       if user_signed_in? 
        @structures = Structure.with_same_activites_as_user(current_user)
       elsif !user_signed_in? && !structure_signed_in?  
        @structures = Structure.all
       end

    end  
    

    def show
      @annonces = Annonce.latest_annonce
      @avis_offres = AvisOffre.latest_avis_offre
    end        

end
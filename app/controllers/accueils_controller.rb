class AccueilsController < ApplicationController

    def index
      
       if user_signed_in? 
        if current_user.try(:admin?)  
          @structures = Structure.all.page(params[:page])        
          @users = User.all.page(params[:page])        
        else  
          @structures = Structure.with_same_activites_as_user(current_user).page(params[:page])
        end  
       elsif !user_signed_in? && !structure_signed_in?  
        @structures = Structure.all.page(params[:page]) 
       elsif structure_signed_in?
        @annonces = current_structure.annonces.page(params[:page])
        @avis_offres = current_structure.avis_offres.page(params[:page]) 
       end

    end  
    

    def show
      @annonces = Annonce.latest_annonce.page(params[:page])
      @avis_offres = AvisOffre.latest_avis_offre.page(params[:page])
    end 

    
    
    def dashboard
        @users = User.all.page(params[:page])
        @structures = Structure.all.page(params[:page])
    end   

end
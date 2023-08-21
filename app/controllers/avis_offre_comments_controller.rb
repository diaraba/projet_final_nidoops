class AvisOffreCommentsController < ApplicationController
    before_action :set_avis_offre

    def create
        @comment = @avis_offre.avis_offre_comments.build(comment_params)
        @comment.user_id = current_user.id
        respond_to do |format|
          if @comment.save
            flash.now[:notice] = 'Commnetaire soumis avec succès'
            format.js { render :index }
          else
            flash.now[:notice] = 'Echec de la soumission du commentaire'
            format.js { render :index }
          end
        end
    end
    


    def edit
      @comment = @avis_offre.avis_offre_comments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'Modification des commentaires en cours'
        format.html { redirect_to @blog }
        format.js { render :edit }
      end
    end
  
    def update
      @comment = @avis_offre.avis_offre_comments.find(params[:id])
      respond_to do |format|
        @comment.user_id = current_user.id
        if @comment.update(comment_params)
          flash.now[:notice] = 'Commentaire modifier avec succes'
          format.js { render :index }
        else
          flash.now[:notice] = 'Echec de la modification du comentaaire'
          format.js { render :index }
        end
      end
    end  

    def destroy
      @comment = AvisOffreComment.find(params[:id])
        @comment.destroy!
        respond_to do |format|
          flash.now[:notice] = 'Commentaire supprimer avec succès'
          format.js { render :index } 
        end
    end
  
    private
    
     def comment_params
        params.require(:avis_offre_comment).permit(:description, :avis_offre_id)
     end
    
     def set_avis_offre
        @avis_offre = AvisOffre.find(params[:avis_offre_id])
     end
end

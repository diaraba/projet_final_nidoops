class AnnonceCommentsController < ApplicationController
    before_action :set_annonce

    def create
        @comment = @annonce.annonce_comments.build(comment_params)
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
      @comment = @annonce.annonce_comments.find(params[:id])
      respond_to do |format|
        flash.now[:notice] = 'Modification des commentaires en cours'
        format.html { redirect_to @blog }
        format.js { render :edit }
      end
    end
  
    def update
      @comment = @annonce.annonce_comments.find(params[:id])
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
      @comment = AnnonceComment.find(params[:id])
        @comment.destroy!
        respond_to do |format|
          flash.now[:notice] = 'Commentaire supprimer avec succès'
          format.js { render :index } 
        end
    end
  
    private
    
     def comment_params
        params.require(:annonce_comment).permit(:description, :annonce_id)
     end
    
     def set_annonce
        @annonce = Annonce.find(params[:annonce_id])
     end
end

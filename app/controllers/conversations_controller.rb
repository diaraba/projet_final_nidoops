class ConversationsController < ApplicationController
    def index
        @conversations = Conversation.all
        # Vous pouvez personnaliser le rendu ici en utilisant des vues (HTML, JSON, etc.)
    end
    
      # Action pour afficher une conversation spécifique par son ID
    def show
        @conversation = Conversation.find(params[:id])
        # Vous pouvez personnaliser le rendu ici en utilisant des vues (HTML, JSON, etc.)
      rescue ActiveRecord::RecordNotFound
        # Gérer le cas où la conversation n'est pas trouvée
        flash[:error] = "La conversation demandée n'existe pas."
        redirect_to conversations_path
    end
end

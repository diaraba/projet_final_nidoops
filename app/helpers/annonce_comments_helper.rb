module AnnonceCommentsHelper
    def correct_user(comment)
     if  user_signed_in?
        true  if current_user.id == comment.user_id  
     end 
    end    
end

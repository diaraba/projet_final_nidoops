module ProfileUsersHelper
    def profile_empty?(user)
        if current_user.admin?
            current_user.profile_user.nil?
        else   
            user.profile_user.nil?
        end    
    end
end

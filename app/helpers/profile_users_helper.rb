module ProfileUsersHelper
    def profile_empty?(user)
        user.profile_user.nil?
    end
end

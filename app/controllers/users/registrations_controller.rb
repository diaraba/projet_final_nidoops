class Users::RegistrationsController < Devise::RegistrationsController

    def create
        super do |resource|
            resource.activite_ids = params[:user][:activite_ids]
            resource.save
        end
    end

    
end

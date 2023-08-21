class Structures::RegistrationsController < Devise::RegistrationsController


    def create
        super do |resource|
            resource.activite_ids = params[:structure][:activite_ids]
            resource.save
        end
    end
end

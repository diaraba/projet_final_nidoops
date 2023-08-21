module StructuresHelper
  

  def est_abonner(structure_id)
    abonnement = Abonnement.specific_abonnement(current_user.id ,structure_id)

    if abonnement.present?
      return true
    else
      return false
    end
  end  
end

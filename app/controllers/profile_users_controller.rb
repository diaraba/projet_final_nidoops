class ProfileUsersController < ApplicationController
    before_action :set_profile, only: %i[ show  destroy]

    def new
      @profile_user = ProfileUser.new
    end  

    def show
        @profile_user = @user.profile_user
    end

    def edit
        @profile_user = current_user.profile_user
    end  

    def update
      @profile_user = current_user.profile_user
      respond_to do |format|
        if @profile_user.update(profile_params)
          format.html { redirect_to accueils_path(), notice: "Profile user was successfully created." }
          #format.json { render :show, status: :created, location: @profile_user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @profile_user.errors, status: :unprocessable_entity }
        end
      end
    end


    def create
      @profile_user = ProfileUser.new(profile_params)
  
      respond_to do |format|
        if @profile_user.save
          format.html { redirect_to profile_user_url(@profile_user), notice: "Profile user was successfully created." }
          format.json { render :show, status: :created, location: @profile_user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @profile_user.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      
      @profile_user.destroy

      respond_to do |format|
        format.html { redirect_to accueils_url, notice: "Annonce was successfully destroyed." }
        format.json { head :no_content }
      end
    end 

    private
      def set_profile
        if user_signed_in?
            @user = User.find(params[:id])
            @profile_user = @user.profile_user
        else
          @user = User.find(params[:id]) 
          @profile_user = @user.profile_user
        end
      end  

      def profile_params
        params.require(:profile_user).permit(:nom, :prenom, :genre, :situation, :numero, :user_id, :image)
      end
end

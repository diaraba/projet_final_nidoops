class ActivitesController < ApplicationController
    before_action :set_activite, only: %i[ show edit update destroy ]

    
      # GET /blogs or /blogs.json
      def index
        @activites = Activite.all
      end
    
  
      # GET /blogs/new
      def new
        @activite = Activite.new
      end
    
      # GET /blogs/1/edit
      def edit
      end
    
      # POST /blogs or /blogs.json
      def create
        @activite = Activite.new(activite_params)
    
        respond_to do |format|
          if @activite.save
            format.html { redirect_to activite_url(@activite), notice: "Avis offre was successfully created." }
            format.json { render :show, status: :created, location: @activite }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @activite.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /blogs/1 or /blogs/1.json
      def update
        respond_to do |format|
          if @activite.update(activite_params)
            format.html { redirect_to activite_url(@activite), notice: "Avis offre was successfully updated." }
            format.json { render :show, status: :ok, location: @activite }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @activite.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /blogs/1 or /blogs/1.json
      def destroy
        @activite.destroy
    
        respond_to do |format|
          format.html { redirect_to activites_url, notice: "Avis offre was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_activite
          @activite = Activite.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def activite_params
          params.require(:activite).permit(:name)
        end
end

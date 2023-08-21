class AvisOffresController < ApplicationController
    before_action :set_avis_offre, only: %i[ show edit update destroy ]
  
    # GET /blogs or /blogs.json
    def index
      @avis_offres = AvisOffre.all
    end
  
    # GET /blogs/1 or /blogs/1.json
    def show
      @comments = @avis_offre.avis_offre_comments
      @comment = @avis_offre.avis_offre_comments.build
    end
  
    # GET /blogs/new
    def new
      @avis_offre = AvisOffre.new
    end
  
    # GET /blogs/1/edit
    def edit
    end
  
    # POST /blogs or /blogs.json
    def create
      @avis_offre = AvisOffre.new(blog_params)
  
      respond_to do |format|
        if @avis_offre.save
          format.html { redirect_to avis_offre_url(@avis_offre), notice: "Avis offre was successfully created." }
          format.json { render :show, status: :created, location: @avis_offre }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @avis_offre.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /blogs/1 or /blogs/1.json
    def update
      respond_to do |format|
        if @avis_offre.update(blog_params)
          format.html { redirect_to avis_offre_url(@avis_offre), notice: "Avis offre was successfully updated." }
          format.json { render :show, status: :ok, location: @avis_offre }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @avis_offre.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /blogs/1 or /blogs/1.json
    def destroy
      @avis_offre.destroy
  
      respond_to do |format|
        format.html { redirect_to avis_offres_url, notice: "Avis offre was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_avis_offre
        @avis_offre = AvisOffre.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def blog_params
        params.require(:avis_offre).permit(:title, :description, :purpose, :condition,:structure_id, :image)
      end
end

class AnnoncesController < ApplicationController
  before_action :set_annonce, only: %i[ show edit update destroy ]
  
  # GET /blogs or /blogs.json
  def index
    @annonces = current_structure.annonces.page(params[:page])
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @comments = @annonce.annonce_comments
    @comment = @annonce.annonce_comments.build
  end

  # GET /blogs/new
  def new
    @annonce = Annonce.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    @annonce = Annonce.new(blog_params)

    respond_to do |format|
      if @annonce.save
        format.html { redirect_to annonce_url(@annonce), notice: "Annonce was successfully created." }
        format.json { render :show, status: :created, location: @annonce }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @annonce.update(blog_params)
        format.html { redirect_to annonce_url(@annonce), notice: "Annonce was successfully updated." }
        format.json { render :show, status: :ok, location: @annonce }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @annonce.destroy

    respond_to do |format|
      format.html { redirect_to annonces_url, notice: "Annonce was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:annonce).permit(:title, :description, :purpose, :structure_id, :image)
    end
end

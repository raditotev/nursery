class AwardsController < AdministrationController
  before_action :set_award, only: [:show, :edit, :update, :destroy]

  # GET /awards
  def index
    @awards = Award.all
  end

  # GET /awards/1
  def show
  end

  # GET /awards/new
  def new
    @award = Award.new
  end

  # GET /awards/1/edit
  def edit
  end

  # POST /awards
  def create
    @award = Award.new(award_params)

    respond_to do |format|
      if @award.save
        format.html { redirect_to @award, flash: {success: 'Award was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /awards/1
  def update
    respond_to do |format|
      if @award.update(award_params)
        format.html { redirect_to @award, flash: {success: 'Award was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /awards/1
  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to admin_awards_url, flash: {success: 'Award was successfully destroyed.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_award
      @award = Award.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def award_params
      params.require(:award).permit(:title, :description, :photo)
    end
end

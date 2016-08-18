class TestemonialsController < AdministrationController
  before_action :set_testemonial, only: [:show, :edit, :update, :destroy]

  # GET /testemonials
  def index
    @testemonials = Testemonial.all
  end

  # GET /testemonials/1
  def show
  end

  # GET /testemonials/new
  def new
    @testemonial = Testemonial.new
  end

  # GET /testemonials/1/edit
  def edit
  end

  # POST /testemonials
  def create
    @testemonial = Testemonial.new(testemonial_params)
    respond_to do |format|
      if @testemonial.save
        # raise testemonial_photo_params.empty?
        if !testemonial_photo_params.empty?
        @testemonial.create_photo(testemonial_photo_params)
        if @testemonial.photo.errors.any?
          @testemonial.destroy
          flash.now[:error] = "You have to upload image."
          format.html {render :new}
        else
          format.html { redirect_to @testemonial, flash: {success: 'Testemonial was successfully created.'} }
        end
      else
          format.html { redirect_to @testemonial, flash: {success: 'Testemonial was successfully created.'} }
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /testemonials/1
  def update
    respond_to do |format|
      if @testemonial.update(testemonial_params)
        format.html { redirect_to @testemonial, flash: {success: 'Testemonial was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /testemonials/1
  def destroy
    @testemonial.destroy
    respond_to do |format|
      format.html { redirect_to admin_testemonials_url, flash: {success: 'Testemonial was successfully destroyed.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testemonial
      @testemonial = Testemonial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testemonial_params
      params.require(:testemonial).permit(:title, :description)
    end

    def testemonial_photo_params
      params.fetch(:photo, {}).permit(:image)
    end
end

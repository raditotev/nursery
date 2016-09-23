class NewslettersController < AdministrationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /newsletters
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  def show
    pdf_url = @newsletter.document.url
    pdf_filename = File.join(Rails.root, '/public' + pdf_url)
    send_file(pdf_filename, filename: @newsletter.document_file_name,
                                          disposition: 'inline', type: "application/pdf")
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters

  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.document = params[:newsletter][:document]

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to admin_newsletters_path, flash: {success: 'Newsletter was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /newsletters/1
  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to admin_newsletters_path, flash: {success: 'Newsletter was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /newsletters/1
  def destroy
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to admin_newsletters_path, flash: {success: 'Newsletter was successfully destroyed.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:name, :document)
    end
end

class BreaksController < AdministrationController
  before_action :set_break, only: [:show, :edit, :update, :destroy]

  # GET /breaks
  def index
    @breaks = Break.all
  end

  # GET /breaks/1
  def show
  end

  # GET /breaks/new
  def new
    @closure = Break.new
  end

  # GET /breaks/1/edit
  def edit
  end

  # POST /breaks
  def create
    @break = Break.new(break_params)

    respond_to do |format|
      if @break.save
        format.html { redirect_to @break, flash: {success: 'Break was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /breaks/1
  def update
    respond_to do |format|
      if @break.update(break_params)
        format.html { redirect_to @break, flash: {success: 'Break was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /breaks/1
  # DELETE /breaks/1.json
  def destroy
    @break.destroy
    respond_to do |format|
      format.html { redirect_to admin_breaks_url, flash: {success: 'Break was successfully destroyed.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_break
      @break = Break.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def break_params
      params.require(:break).permit(:start_date, :end_date, :description)
    end
end

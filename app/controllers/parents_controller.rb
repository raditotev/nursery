class ParentsController < AdministrationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  # GET /parents
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  def show
  end

  # GET /parents/new
  def new
    @parent = Parent.new
  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  def create
    @parent = Parent.new(parent_params)

    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, flash: {success: 'Parent was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /parents/1
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, flash: {success: 'Parent was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to admin_parents_url, flash: {success: 'Parent was successfully destroyed.'} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:title, :first_name, :last_name, :email, :password)
    end
end

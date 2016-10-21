class AdminsController < AdministrationController
  before_action :super_admin, only: [:new, :create, :update, :destroy]
  before_action :set_admin, only: [:show, :edit, :update, :destroy]


  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.order(superadmin: :desc)
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, flash: {success: 'Admin was successfully created.'} }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admins/1
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_dashboard_path, flash: {success: 'Admin was successfully updated.'} }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url, flash: {success: 'Admin was successfully destroyed.'} }
    end
  end

  def super_admin
    unless current_admin.superadmin
      flash[:error] = "You're not authorized!"
      redirect_back(fallback_location: new_admin_session_path)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :email, :password)
    end
end

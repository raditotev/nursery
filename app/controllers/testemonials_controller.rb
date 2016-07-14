class TestemonialsController < ApplicationController
  before_action :set_testemonial, only: [:show, :edit, :update, :destroy]

  # GET /testemonials
  # GET /testemonials.json
  def index
    @testemonials = Testemonial.all
  end

  # GET /testemonials/1
  # GET /testemonials/1.json
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
  # POST /testemonials.json
  def create
    @testemonial = Testemonial.new(testemonial_params)

    respond_to do |format|
      if @testemonial.save
        format.html { redirect_to @testemonial, notice: 'Testemonial was successfully created.' }
        format.json { render :show, status: :created, location: @testemonial }
      else
        format.html { render :new }
        format.json { render json: @testemonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testemonials/1
  # PATCH/PUT /testemonials/1.json
  def update
    respond_to do |format|
      if @testemonial.update(testemonial_params)
        format.html { redirect_to @testemonial, notice: 'Testemonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @testemonial }
      else
        format.html { render :edit }
        format.json { render json: @testemonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testemonials/1
  # DELETE /testemonials/1.json
  def destroy
    @testemonial.destroy
    respond_to do |format|
      format.html { redirect_to testemonials_url, notice: 'Testemonial was successfully destroyed.' }
      format.json { head :no_content }
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
end

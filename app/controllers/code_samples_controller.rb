class CodeSamplesController < ApplicationController
  before_action :set_code_sample, only: [:show, :edit, :update, :destroy]

  # GET /code_samples
  # GET /code_samples.json
  def index
    @code_samples = CodeSample.all
  end

  # GET /code_samples/1
  # GET /code_samples/1.json
  def show
  end

  # GET /code_samples/new
  def new
    @code_sample = CodeSample.new
  end

  # GET /code_samples/1/edit
  def edit
  end

  # POST /code_samples
  # POST /code_samples.json
  def create
    @code_sample = current_user.code_samples.new(code_sample_params)

    respond_to do |format|
      if @code_sample.save
        format.html { redirect_to @code_sample, notice: 'Code sample was successfully created.' }
        format.json { render :show, status: :created, location: @code_sample }
      else
        format.html { render :new }
        format.json { render json: @code_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /code_samples/1
  # PATCH/PUT /code_samples/1.json
  def update
    respond_to do |format|
      if @code_sample.update(code_sample_params)
        format.html { redirect_to @code_sample, notice: 'Code sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @code_sample }
      else
        format.html { render :edit }
        format.json { render json: @code_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /code_samples/1
  # DELETE /code_samples/1.json
  def destroy
    @code_sample.destroy
    respond_to do |format|
      format.html { redirect_to code_samples_url, notice: 'Code sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code_sample
      @code_sample = CodeSample.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def code_sample_params
      params.require(:code_sample).permit(:title, :versions, :description, :code, :featured)
    end
end

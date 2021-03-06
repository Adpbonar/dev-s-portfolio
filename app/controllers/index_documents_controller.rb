class IndexDocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_index_document, only: [:edit, :update]

  # GET /index_documents
  # GET /index_documents.json
  def index
    @index_documents = IndexDocument.all
  end

  # GET /index_documents/1/edit
  def edit
  end

  # PATCH/PUT /index_documents/1
  # PATCH/PUT /index_documents/1.json
  def update
    respond_to do |format|
      if @index_document.update(index_document_params)
        format.html { redirect_to root_path, notice: 'Index document was successfully updated.' }
        format.json { render :show, status: :ok, location: @index_document }
      else
        format.html { render :edit }
        format.json { render json: @index_document.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_index_document
      @index_document = IndexDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def index_document_params
      params.require(:index_document).permit(:brand_statement, :mobile_brand_one, :mobile_brand_two, :image)
    end
end

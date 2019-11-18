class AboutDocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_about_document, only: [ :edit, :update]

  # GET /about_documents
  # GET /about_documents.json
  def index
    @about_documents = AboutDocument.all
  end

  # PATCH/PUT /about_documents/1
  # PATCH/PUT /about_documents/1.json
  def update
    respond_to do |format|
      if @about_document.update(about_document_params)
        format.html { redirect_to about_path, notice: 'About document was successfully updated.' }
        format.json { render :show, status: :ok, location: @about_document }
      else
        format.html { render :edit }
        format.json { render json: @about_document.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_about_document
      @about_document = AboutDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def about_document_params
      params.require(:about_document).permit(:about_statement, :image)
    end
end

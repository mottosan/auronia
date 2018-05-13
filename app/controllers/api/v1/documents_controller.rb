module Api::V1
  class DocumentsController < ApiController
    rescue_from StandardError, :with => :render_error_response
    before_action :set_document, only: [:show, :destroy, :update]

    # GET /documents
    def index
      @documents = current_user.documents.includes(:tags)

      render json: @documents.to_json(**show_options)
    end

    # GET /documents/1
    def show
      render json: @document.to_json(**show_options)
    end

    # POST /documents
    def create
      params_with_user = document_params.merge(user_id: current_user.id)
      @document = Document.new(params_with_user)

      if @document.save
        render json: @document.to_json(**show_options)
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    # DELETE /documents/1
    def destroy
      @document.destroy
    end

    # PUT /documents/1
    def update
      if @document.update_attributes(document_params)
        render json: @document
      else
        render json: @document.errors, status: :unprocessable_entity
      end
    end

    private
      def show_options
        {
          only: [:id, :name, :attachment_url, :updated_at, :created_at],
          include: {
            tags: { only: [:name] },
            attachment: { only: [:url]}
          }
        }
      end

      def set_document
        @document = current_user.documents.find_by(id: params[:id])
        unless @document
          render json: {
            error: "Document #{params[:id]} not found"
          }, status: 404
        end
      end

      def document_params
        params.require(:document).permit(:name, :attachment, tags_attributes: [:name])
      end
  end
end

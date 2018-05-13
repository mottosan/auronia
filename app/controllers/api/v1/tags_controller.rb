module Api::V1
  class TagsController < ApiController
    rescue_from StandardError, :with => :render_error_response
    before_action :set_document
    before_action :set_tag, only: [:destroy, :update]

    # GET /documents/1/tags
    def index
      render json: @document.tags.to_json(**show_options)
    end

    # GET /documents/1/tags/1
    def show
      render json: @tag.to_json(**show_options)
    end

    # POST /documents/1/tags
    def create
      @tag = Tag.new(tag_params)

      if @tag.save
        render json: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    # DELETE /documents/1/tags/1
    def destroy
      @tag.destroy
    end

    # PUT /documents/1/tags/1
    def update
      if @tag.update_attributes(tag_params)
        render json: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end

    private
      def render_error_response(error)
        render json: {
          message: error.message
        }, status: 500
      end

      def show_options
        {
          only: [:id, :name, :created_at]
        }
      end

      def set_tag
        @tag = @document.tags.find(params[:id])
        unless @tag
          render json: {
            error: "Tag #{params[:id]} not found"
          }, status: 404
        end
      end

      def set_document
        @document = current_user.documents.find_by(id: params[:document_id])
        unless @document
          render json: {
            error: "Document #{params[:document_id]} not found"
          }, status: 404
        end
      end

      # Only allow a trusted parameter "white list" through.
      def tag_params
        params.require(:tag).permit(:document_id, :name)
      end
  end
end

class PiecesController < ApplicationController
  before_action :set_piece, only: %i[ show update destroy ]

  def index
    filters = filter_params
    page_num = page_params.present? ? page_params[:page] : 1
    order_params = sort_params
    @pieces = Piece.by_composer(filters[:composer])
                   .by_form(filters[:form]) .by_key(filters[:key])
                   .composed_before(filters[:composed_before])
                   .composed_after(filters[:composed_after])
                   .page(page_num)

    if order_params.present?
      sql_string = []
      order_params[:sort_by].each do |k, v|
        sql_string << "#{k} #{v}"
      end
      @pieces = @pieces.order(Arel.sql("#{sql_string.join(", ")}"))
    end

    render json: @pieces
  end

  # GET /pieces/1
  def show
    render json: @piece
  end

  # POST /pieces
  def create
    @piece = Piece.new(piece_params)

    if @piece.save
      render json: @piece, status: :created, location: @piece
    else
      render json: @piece.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pieces/1
  def update
    if @piece.update(piece_params)
      render json: @piece
    else
      render json: @piece.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pieces/1
  def destroy
    @piece.destroy!
  end

  private

  def set_piece
    @piece = Piece.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def piece_params
    params.require(:piece).permit(:id, :name, :composer,
                                  :composition_year,
                                  :form, :key)
  end

  def filter_params
    params.permit(:id, :composer, :form, :key, :composed_before,
                  :composed_after)
  end

  def page_params
    params.permit(:page)
  end

  def sort_params
    params.permit(sort_by: {})
  end
end

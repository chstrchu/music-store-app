class PiecesController < ApplicationController
  before_action :set_piece, only: %i[ show update destroy ]

  def index
    filters = filter_params
    @pieces = Piece.by_composer(filters[:composer])
                   .by_form(filters[:form])
                   .by_key(filters[:key])
                   .composed_before(filters[:composed_before])
                   .composed_after(filters[:composed_after])

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
end

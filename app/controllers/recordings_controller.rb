class RecordingsController < ApplicationController
  before_action :set_recording, only: %i[ show update destroy ]

  # GET /recordings
  def index
    composer, piece = piece_search_params
    @recordings = Recording.by_name(name_params[:recording_name])
                           .by_artist_name(artist_search_params[:artist_name])
                           .by_composer(composer)
                           .by_piece_name(piece)

    render json: @recordings
  end

  # GET /recordings/1
  def show
    render json: @recording, include: ['pieces']
  end

  # POST /recordings
  def create
    @recording = Recording.new(recording_params)

    if @recording.save
      render json: @recording, status: :created, location: @recording
    else
      render json: @recording.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recordings/1
  def update
    if @recording.update(recording_params)
      render json: @recording
    else
      render json: @recording.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recordings/1
  def destroy
    @recording.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recording
    @recording = Recording.find(params[:id])
  end

  def name_params
    params.permit(:name)
  end

  def piece_search_params
    param_string = params.permit(:piece_search)[:piece_search]
    return unless param_string

    search_tokens = param_string.split(' ')
    composer = search_tokens[0]
    piece = search_tokens[1..].join(' ')
    [composer, piece]
  end

  def artist_search_params
    params.permit(:artist_search)
  end

  # Only allow a list of trusted parameters through.
  def recording_params
    params.fetch(:recording, {})
  end
end

class RecordingsController < ApplicationController
  before_action :set_recording, only: %i[ show update destroy ]

  # GET /recordings
  def index
    @recordings = Recording.all

    render json: @recordings
  end

  # GET /recordings/1
  def show
    render json: @recording
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

    # Only allow a list of trusted parameters through.
    def recording_params
      params.fetch(:recording, {})
    end
end

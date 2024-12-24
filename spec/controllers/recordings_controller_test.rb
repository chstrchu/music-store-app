require "test_helper"

class RecordingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recording = recordings(:one)
  end

  test "should get index" do
    get recordings_url, as: :json
    assert_response :success
  end

  test "should create recording" do
    assert_difference("Recording.count") do
      post recordings_url, params: { recording: {} }, as: :json
    end

    assert_response :created
  end

  test "should show recording" do
    get recording_url(@recording), as: :json
    assert_response :success
  end

  test "should update recording" do
    patch recording_url(@recording), params: { recording: {} }, as: :json
    assert_response :success
  end

  test "should destroy recording" do
    assert_difference("Recording.count", -1) do
      delete recording_url(@recording), as: :json
    end

    assert_response :no_content
  end
end

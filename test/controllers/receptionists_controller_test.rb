require "test_helper"

class ReceptionistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get receptionists_index_url
    assert_response :success
  end
end

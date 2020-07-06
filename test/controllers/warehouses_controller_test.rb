require 'test_helper'

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get warehouses_new_url
    assert_response :success
  end

  test "should get create" do
    get warehouses_create_url
    assert_response :success
  end

end

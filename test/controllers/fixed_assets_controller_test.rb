require 'test_helper'

class FixedAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fixed_asset = fixed_assets(:one)
  end

  test "should get index" do
    get fixed_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_fixed_asset_url
    assert_response :success
  end

  test "should create fixed_asset" do
    assert_difference('FixedAsset.count') do
      post fixed_assets_url, params: { fixed_asset: { InstalledLocation: @fixed_asset.InstalledLocation, RackUnit: @fixed_asset.RackUnit, part_id: @fixed_asset.part_id } }
    end

    assert_redirected_to fixed_asset_url(FixedAsset.last)
  end

  test "should show fixed_asset" do
    get fixed_asset_url(@fixed_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_fixed_asset_url(@fixed_asset)
    assert_response :success
  end

  test "should update fixed_asset" do
    patch fixed_asset_url(@fixed_asset), params: { fixed_asset: { InstalledLocation: @fixed_asset.InstalledLocation, RackUnit: @fixed_asset.RackUnit, part_id: @fixed_asset.part_id } }
    assert_redirected_to fixed_asset_url(@fixed_asset)
  end

  test "should destroy fixed_asset" do
    assert_difference('FixedAsset.count', -1) do
      delete fixed_asset_url(@fixed_asset)
    end

    assert_redirected_to fixed_assets_url
  end
end

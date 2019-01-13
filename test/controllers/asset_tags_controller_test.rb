require 'test_helper'

class AssetTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset_tag = asset_tags(:one)
  end

  test "should get index" do
    get asset_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_tag_url
    assert_response :success
  end

  test "should create asset_tag" do
    assert_difference('AssetTag.count') do
      post asset_tags_url, params: { asset_tag: { consumable_id: @asset_tag.consumable_id, location_id: @asset_tag.location_id, tag: @asset_tag.tag } }
    end

    assert_redirected_to asset_tag_url(AssetTag.last)
  end

  test "should show asset_tag" do
    get asset_tag_url(@asset_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_tag_url(@asset_tag)
    assert_response :success
  end

  test "should update asset_tag" do
    patch asset_tag_url(@asset_tag), params: { asset_tag: { consumable_id: @asset_tag.consumable_id, location_id: @asset_tag.location_id, tag: @asset_tag.tag } }
    assert_redirected_to asset_tag_url(@asset_tag)
  end

  test "should destroy asset_tag" do
    assert_difference('AssetTag.count', -1) do
      delete asset_tag_url(@asset_tag)
    end

    assert_redirected_to asset_tags_url
  end
end

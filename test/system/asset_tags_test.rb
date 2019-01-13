require "application_system_test_case"

class AssetTagsTest < ApplicationSystemTestCase
  setup do
    @asset_tag = asset_tags(:one)
  end

  test "visiting the index" do
    visit asset_tags_url
    assert_selector "h1", text: "Asset Tags"
  end

  test "creating a Asset tag" do
    visit asset_tags_url
    click_on "New Asset Tag"

    fill_in "Consumable", with: @asset_tag.consumable_id
    fill_in "Location", with: @asset_tag.location_id
    fill_in "Tag", with: @asset_tag.tag
    click_on "Create Asset tag"

    assert_text "Asset tag was successfully created"
    click_on "Back"
  end

  test "updating a Asset tag" do
    visit asset_tags_url
    click_on "Edit", match: :first

    fill_in "Consumable", with: @asset_tag.consumable_id
    fill_in "Location", with: @asset_tag.location_id
    fill_in "Tag", with: @asset_tag.tag
    click_on "Update Asset tag"

    assert_text "Asset tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Asset tag" do
    visit asset_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asset tag was successfully destroyed"
  end
end

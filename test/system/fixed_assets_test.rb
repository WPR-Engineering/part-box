require "application_system_test_case"

class FixedAssetsTest < ApplicationSystemTestCase
  setup do
    @fixed_asset = fixed_assets(:one)
  end

  test "visiting the index" do
    visit fixed_assets_url
    assert_selector "h1", text: "Fixed Assets"
  end

  test "creating a Fixed asset" do
    visit fixed_assets_url
    click_on "New Fixed Asset"

    fill_in "Installedlocation", with: @fixed_asset.InstalledLocation
    fill_in "Rackunit", with: @fixed_asset.RackUnit
    fill_in "Part", with: @fixed_asset.part_id
    click_on "Create Fixed asset"

    assert_text "Fixed asset was successfully created"
    click_on "Back"
  end

  test "updating a Fixed asset" do
    visit fixed_assets_url
    click_on "Edit", match: :first

    fill_in "Installedlocation", with: @fixed_asset.InstalledLocation
    fill_in "Rackunit", with: @fixed_asset.RackUnit
    fill_in "Part", with: @fixed_asset.part_id
    click_on "Update Fixed asset"

    assert_text "Fixed asset was successfully updated"
    click_on "Back"
  end

  test "destroying a Fixed asset" do
    visit fixed_assets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fixed asset was successfully destroyed"
  end
end

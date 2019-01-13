require "application_system_test_case"

class ConsumablesTest < ApplicationSystemTestCase
  setup do
    @consumable = consumables(:one)
  end

  test "visiting the index" do
    visit consumables_url
    assert_selector "h1", text: "Consumables"
  end

  test "creating a Consumable" do
    visit consumables_url
    click_on "New Consumable"

    fill_in "Bin", with: @consumable.bin
    fill_in "Description", with: @consumable.description
    fill_in "Location", with: @consumable.location
    fill_in "Name", with: @consumable.name
    fill_in "Obsolete", with: @consumable.obsolete
    fill_in "Quantity", with: @consumable.quantity
    fill_in "Reorderamount", with: @consumable.reorderAmount
    fill_in "Shelf", with: @consumable.shelf
    fill_in "Tag", with: @consumable.tag
    click_on "Create Consumable"

    assert_text "Consumable was successfully created"
    click_on "Back"
  end

  test "updating a Consumable" do
    visit consumables_url
    click_on "Edit", match: :first

    fill_in "Bin", with: @consumable.bin
    fill_in "Description", with: @consumable.description
    fill_in "Location", with: @consumable.location
    fill_in "Name", with: @consumable.name
    fill_in "Obsolete", with: @consumable.obsolete
    fill_in "Quantity", with: @consumable.quantity
    fill_in "Reorderamount", with: @consumable.reorderAmount
    fill_in "Shelf", with: @consumable.shelf
    fill_in "Tag", with: @consumable.tag
    click_on "Update Consumable"

    assert_text "Consumable was successfully updated"
    click_on "Back"
  end

  test "destroying a Consumable" do
    visit consumables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Consumable was successfully destroyed"
  end
end

require "application_system_test_case"

class ArticalesTest < ApplicationSystemTestCase
  setup do
    @articale = articales(:one)
  end

  test "visiting the index" do
    visit articales_url
    assert_selector "h1", text: "Articales"
  end

  test "creating a Articale" do
    visit articales_url
    click_on "New Articale"

    fill_in "Description", with: @articale.description
    fill_in "String", with: @articale.string
    fill_in "Title", with: @articale.title
    click_on "Create Articale"

    assert_text "Articale was successfully created"
    click_on "Back"
  end

  test "updating a Articale" do
    visit articales_url
    click_on "Edit", match: :first

    fill_in "Description", with: @articale.description
    fill_in "String", with: @articale.string
    fill_in "Title", with: @articale.title
    click_on "Update Articale"

    assert_text "Articale was successfully updated"
    click_on "Back"
  end

  test "destroying a Articale" do
    visit articales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Articale was successfully destroyed"
  end
end

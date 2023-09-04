require "application_system_test_case"

class ArtikelkategoriesTest < ApplicationSystemTestCase
  setup do
    @artikelkategory = artikelkategories(:one)
  end

  test "visiting the index" do
    visit artikelkategories_url
    assert_selector "h1", text: "Artikelkategories"
  end

  test "should create artikelkategorie" do
    visit artikelkategories_url
    click_on "New artikelkategorie"

    fill_in "Kategorie", with: @artikelkategory.kategorie
    click_on "Create Artikelkategorie"

    assert_text "Artikelkategorie was successfully created"
    click_on "Back"
  end

  test "should update Artikelkategorie" do
    visit artikelkategory_url(@artikelkategory)
    click_on "Edit this artikelkategorie", match: :first

    fill_in "Kategorie", with: @artikelkategory.kategorie
    click_on "Update Artikelkategorie"

    assert_text "Artikelkategorie was successfully updated"
    click_on "Back"
  end

  test "should destroy Artikelkategorie" do
    visit artikelkategory_url(@artikelkategory)
    click_on "Destroy this artikelkategorie", match: :first

    assert_text "Artikelkategorie was successfully destroyed"
  end
end

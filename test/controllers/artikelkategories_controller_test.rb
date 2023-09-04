require "test_helper"

class ArtikelkategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artikelkategory = artikelkategories(:one)
  end

  test "should get index" do
    get artikelkategories_url
    assert_response :success
  end

  test "should get new" do
    get new_artikelkategory_url
    assert_response :success
  end

  test "should create artikelkategory" do
    assert_difference("Artikelkategorie.count") do
      post artikelkategories_url, params: { artikelkategory: { kategorie: @artikelkategory.kategorie } }
    end

    assert_redirected_to artikelkategory_url(Artikelkategorie.last)
  end

  test "should show artikelkategory" do
    get artikelkategory_url(@artikelkategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_artikelkategory_url(@artikelkategory)
    assert_response :success
  end

  test "should update artikelkategory" do
    patch artikelkategory_url(@artikelkategory), params: { artikelkategory: { kategorie: @artikelkategory.kategorie } }
    assert_redirected_to artikelkategory_url(@artikelkategory)
  end

  test "should destroy artikelkategory" do
    assert_difference("Artikelkategorie.count", -1) do
      delete artikelkategory_url(@artikelkategory)
    end

    assert_redirected_to artikelkategories_url
  end
end

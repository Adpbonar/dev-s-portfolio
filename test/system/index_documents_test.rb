require "application_system_test_case"

class IndexDocumentsTest < ApplicationSystemTestCase
  setup do
    @index_document = index_documents(:one)
  end

  test "visiting the index" do
    visit index_documents_url
    assert_selector "h1", text: "Index Documents"
  end

  test "creating a Index document" do
    visit index_documents_url
    click_on "New Index Document"

    click_on "Create Index document"

    assert_text "Index document was successfully created"
    click_on "Back"
  end

  test "updating a Index document" do
    visit index_documents_url
    click_on "Edit", match: :first

    click_on "Update Index document"

    assert_text "Index document was successfully updated"
    click_on "Back"
  end

  test "destroying a Index document" do
    visit index_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Index document was successfully destroyed"
  end
end

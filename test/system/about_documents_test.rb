require "application_system_test_case"

class AboutDocumentsTest < ApplicationSystemTestCase
  setup do
    @about_document = about_documents(:one)
  end

  test "visiting the index" do
    visit about_documents_url
    assert_selector "h1", text: "About Documents"
  end

  test "creating a About document" do
    visit about_documents_url
    click_on "New About Document"

    click_on "Create About document"

    assert_text "About document was successfully created"
    click_on "Back"
  end

  test "updating a About document" do
    visit about_documents_url
    click_on "Edit", match: :first

    click_on "Update About document"

    assert_text "About document was successfully updated"
    click_on "Back"
  end

  test "destroying a About document" do
    visit about_documents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "About document was successfully destroyed"
  end
end

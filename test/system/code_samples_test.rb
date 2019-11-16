require "application_system_test_case"

class CodeSamplesTest < ApplicationSystemTestCase
  setup do
    @code_sample = code_samples(:one)
  end

  test "visiting the index" do
    visit code_samples_url
    assert_selector "h1", text: "Code Samples"
  end

  test "creating a Code sample" do
    visit code_samples_url
    click_on "New Code Sample"

    fill_in "Code", with: @code_sample.code
    fill_in "Description", with: @code_sample.description
    fill_in "Featured", with: @code_sample.featured
    fill_in "Title", with: @code_sample.title
    fill_in "Versions", with: @code_sample.versions
    click_on "Create Code sample"

    assert_text "Code sample was successfully created"
    click_on "Back"
  end

  test "updating a Code sample" do
    visit code_samples_url
    click_on "Edit", match: :first

    fill_in "Code", with: @code_sample.code
    fill_in "Description", with: @code_sample.description
    fill_in "Featured", with: @code_sample.featured
    fill_in "Title", with: @code_sample.title
    fill_in "Versions", with: @code_sample.versions
    click_on "Update Code sample"

    assert_text "Code sample was successfully updated"
    click_on "Back"
  end

  test "destroying a Code sample" do
    visit code_samples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Code sample was successfully destroyed"
  end
end

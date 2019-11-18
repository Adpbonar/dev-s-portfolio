require 'test_helper'

class AboutDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @about_document = about_documents(:one)
  end

  test "should get index" do
    get about_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_about_document_url
    assert_response :success
  end

  test "should create about_document" do
    assert_difference('AboutDocument.count') do
      post about_documents_url, params: { about_document: {  } }
    end

    assert_redirected_to about_document_url(AboutDocument.last)
  end

  test "should show about_document" do
    get about_document_url(@about_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_about_document_url(@about_document)
    assert_response :success
  end

  test "should update about_document" do
    patch about_document_url(@about_document), params: { about_document: {  } }
    assert_redirected_to about_document_url(@about_document)
  end

  test "should destroy about_document" do
    assert_difference('AboutDocument.count', -1) do
      delete about_document_url(@about_document)
    end

    assert_redirected_to about_documents_url
  end
end

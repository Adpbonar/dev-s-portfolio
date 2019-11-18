require 'test_helper'

class IndexDocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @index_document = index_documents(:one)
  end

  test "should get index" do
    get index_documents_url
    assert_response :success
  end

  test "should get new" do
    get new_index_document_url
    assert_response :success
  end

  test "should create index_document" do
    assert_difference('IndexDocument.count') do
      post index_documents_url, params: { index_document: {  } }
    end

    assert_redirected_to index_document_url(IndexDocument.last)
  end

  test "should show index_document" do
    get index_document_url(@index_document)
    assert_response :success
  end

  test "should get edit" do
    get edit_index_document_url(@index_document)
    assert_response :success
  end

  test "should update index_document" do
    patch index_document_url(@index_document), params: { index_document: {  } }
    assert_redirected_to index_document_url(@index_document)
  end

  test "should destroy index_document" do
    assert_difference('IndexDocument.count', -1) do
      delete index_document_url(@index_document)
    end

    assert_redirected_to index_documents_url
  end
end

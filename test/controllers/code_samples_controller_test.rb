require 'test_helper'

class CodeSamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @code_sample = code_samples(:one)
  end

  test "should get index" do
    get code_samples_url
    assert_response :success
  end

  test "should get new" do
    get new_code_sample_url
    assert_response :success
  end

  test "should create code_sample" do
    assert_difference('CodeSample.count') do
      post code_samples_url, params: { code_sample: { code: @code_sample.code, description: @code_sample.description, featured: @code_sample.featured, title: @code_sample.title, versions: @code_sample.versions } }
    end

    assert_redirected_to code_sample_url(CodeSample.last)
  end

  test "should show code_sample" do
    get code_sample_url(@code_sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_code_sample_url(@code_sample)
    assert_response :success
  end

  test "should update code_sample" do
    patch code_sample_url(@code_sample), params: { code_sample: { code: @code_sample.code, description: @code_sample.description, featured: @code_sample.featured, title: @code_sample.title, versions: @code_sample.versions } }
    assert_redirected_to code_sample_url(@code_sample)
  end

  test "should destroy code_sample" do
    assert_difference('CodeSample.count', -1) do
      delete code_sample_url(@code_sample)
    end

    assert_redirected_to code_samples_url
  end
end

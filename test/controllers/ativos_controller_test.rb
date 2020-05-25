require 'test_helper'

class AtivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ativo = ativos(:one)
  end

  test "should get index" do
    get ativos_url
    assert_response :success
  end

  test "should get new" do
    get new_ativo_url
    assert_response :success
  end

  test "should create ativo" do
    assert_difference('Ativo.count') do
      post ativos_url, params: { ativo: { descricao_ativo: @ativo.descricao_ativo, references: @ativo.references } }
    end

    assert_redirected_to ativo_url(Ativo.last)
  end

  test "should show ativo" do
    get ativo_url(@ativo)
    assert_response :success
  end

  test "should get edit" do
    get edit_ativo_url(@ativo)
    assert_response :success
  end

  test "should update ativo" do
    patch ativo_url(@ativo), params: { ativo: { descricao_ativo: @ativo.descricao_ativo, references: @ativo.references } }
    assert_redirected_to ativo_url(@ativo)
  end

  test "should destroy ativo" do
    assert_difference('Ativo.count', -1) do
      delete ativo_url(@ativo)
    end

    assert_redirected_to ativos_url
  end
end

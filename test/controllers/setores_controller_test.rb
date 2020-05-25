require 'test_helper'

class SetoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setor = setores(:one)
  end

  test "should get index" do
    get setores_url
    assert_response :success
  end

  test "should get new" do
    get new_setor_url
    assert_response :success
  end

  test "should create setor" do
    assert_difference('Setor.count') do
      post setores_url, params: { setor: { nome: @setor.nome, ramal: @setor.ramal, sigla: @setor.sigla } }
    end

    assert_redirected_to setor_url(Setor.last)
  end

  test "should show setor" do
    get setor_url(@setor)
    assert_response :success
  end

  test "should get edit" do
    get edit_setor_url(@setor)
    assert_response :success
  end

  test "should update setor" do
    patch setor_url(@setor), params: { setor: { nome: @setor.nome, ramal: @setor.ramal, sigla: @setor.sigla } }
    assert_redirected_to setor_url(@setor)
  end

  test "should destroy setor" do
    assert_difference('Setor.count', -1) do
      delete setor_url(@setor)
    end

    assert_redirected_to setores_url
  end
end

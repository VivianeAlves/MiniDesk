require 'test_helper'

class ChamadoTecnicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chamado_tecnico = chamado_tecnicos(:one)
  end

  test "should get index" do
    get chamado_tecnicos_url
    assert_response :success
  end

  test "should get new" do
    get new_chamado_tecnico_url
    assert_response :success
  end

  test "should create chamado_tecnico" do
    assert_difference('ChamadoTecnico.count') do
      post chamado_tecnicos_url, params: { chamado_tecnico: { chamado_id: @chamado_tecnico.chamado_id, usuario_id: @chamado_tecnico.usuario_id } }
    end

    assert_redirected_to chamado_tecnico_url(ChamadoTecnico.last)
  end

  test "should show chamado_tecnico" do
    get chamado_tecnico_url(@chamado_tecnico)
    assert_response :success
  end

  test "should get edit" do
    get edit_chamado_tecnico_url(@chamado_tecnico)
    assert_response :success
  end

  test "should update chamado_tecnico" do
    patch chamado_tecnico_url(@chamado_tecnico), params: { chamado_tecnico: { chamado_id: @chamado_tecnico.chamado_id, usuario_id: @chamado_tecnico.usuario_id } }
    assert_redirected_to chamado_tecnico_url(@chamado_tecnico)
  end

  test "should destroy chamado_tecnico" do
    assert_difference('ChamadoTecnico.count', -1) do
      delete chamado_tecnico_url(@chamado_tecnico)
    end

    assert_redirected_to chamado_tecnicos_url
  end
end

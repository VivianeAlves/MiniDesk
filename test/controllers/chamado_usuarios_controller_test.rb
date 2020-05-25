require 'test_helper'

class ChamadoUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chamado_usuario = chamado_usuarios(:one)
  end

  test "should get index" do
    get chamado_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_chamado_usuario_url
    assert_response :success
  end

  test "should create chamado_usuario" do
    assert_difference('ChamadoUsuario.count') do
      post chamado_usuarios_url, params: { chamado_usuario: { chamado_id: @chamado_usuario.chamado_id, usuario_id: @chamado_usuario.usuario_id } }
    end

    assert_redirected_to chamado_usuario_url(ChamadoUsuario.last)
  end

  test "should show chamado_usuario" do
    get chamado_usuario_url(@chamado_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_chamado_usuario_url(@chamado_usuario)
    assert_response :success
  end

  test "should update chamado_usuario" do
    patch chamado_usuario_url(@chamado_usuario), params: { chamado_usuario: { chamado_id: @chamado_usuario.chamado_id, usuario_id: @chamado_usuario.usuario_id } }
    assert_redirected_to chamado_usuario_url(@chamado_usuario)
  end

  test "should destroy chamado_usuario" do
    assert_difference('ChamadoUsuario.count', -1) do
      delete chamado_usuario_url(@chamado_usuario)
    end

    assert_redirected_to chamado_usuarios_url
  end
end

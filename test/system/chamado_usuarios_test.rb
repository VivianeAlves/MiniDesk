require "application_system_test_case"

class ChamadoUsuariosTest < ApplicationSystemTestCase
  setup do
    @chamado_usuario = chamado_usuarios(:one)
  end

  test "visiting the index" do
    visit chamado_usuarios_url
    assert_selector "h1", text: "Chamado Usuarios"
  end

  test "creating a Chamado usuario" do
    visit chamado_usuarios_url
    click_on "New Chamado Usuario"

    fill_in "Chamado", with: @chamado_usuario.chamado_id
    fill_in "Usuario", with: @chamado_usuario.usuario_id
    click_on "Create Chamado usuario"

    assert_text "Chamado usuario was successfully created"
    click_on "Back"
  end

  test "updating a Chamado usuario" do
    visit chamado_usuarios_url
    click_on "Edit", match: :first

    fill_in "Chamado", with: @chamado_usuario.chamado_id
    fill_in "Usuario", with: @chamado_usuario.usuario_id
    click_on "Update Chamado usuario"

    assert_text "Chamado usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Chamado usuario" do
    visit chamado_usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chamado usuario was successfully destroyed"
  end
end

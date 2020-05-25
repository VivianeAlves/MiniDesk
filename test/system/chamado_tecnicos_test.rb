require "application_system_test_case"

class ChamadoTecnicosTest < ApplicationSystemTestCase
  setup do
    @chamado_tecnico = chamado_tecnicos(:one)
  end

  test "visiting the index" do
    visit chamado_tecnicos_url
    assert_selector "h1", text: "Chamado Tecnicos"
  end

  test "creating a Chamado tecnico" do
    visit chamado_tecnicos_url
    click_on "New Chamado Tecnico"

    fill_in "Chamado", with: @chamado_tecnico.chamado_id
    fill_in "Usuario", with: @chamado_tecnico.usuario_id
    click_on "Create Chamado tecnico"

    assert_text "Chamado tecnico was successfully created"
    click_on "Back"
  end

  test "updating a Chamado tecnico" do
    visit chamado_tecnicos_url
    click_on "Edit", match: :first

    fill_in "Chamado", with: @chamado_tecnico.chamado_id
    fill_in "Usuario", with: @chamado_tecnico.usuario_id
    click_on "Update Chamado tecnico"

    assert_text "Chamado tecnico was successfully updated"
    click_on "Back"
  end

  test "destroying a Chamado tecnico" do
    visit chamado_tecnicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chamado tecnico was successfully destroyed"
  end
end

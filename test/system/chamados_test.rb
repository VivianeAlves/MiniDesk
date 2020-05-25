require "application_system_test_case"

class ChamadosTest < ApplicationSystemTestCase
  setup do
    @chamado = chamados(:one)
  end

  test "visiting the index" do
    visit chamados_url
    assert_selector "h1", text: "Chamados"
  end

  test "creating a Chamado" do
    visit chamados_url
    click_on "New Chamado"

    fill_in "Acao", with: @chamado.acao_id
    fill_in "Ativo", with: @chamado.ativo_id
    fill_in "Data", with: @chamado.data
    fill_in "Descricao chamado", with: @chamado.descricao_chamado
    fill_in "Observacoes", with: @chamado.observacoes
    fill_in "Status", with: @chamado.status_id
    fill_in "Tipo", with: @chamado.tipo_id
    click_on "Create Chamado"

    assert_text "Chamado was successfully created"
    click_on "Back"
  end

  test "updating a Chamado" do
    visit chamados_url
    click_on "Edit", match: :first

    fill_in "Acao", with: @chamado.acao_id
    fill_in "Ativo", with: @chamado.ativo_id
    fill_in "Data", with: @chamado.data
    fill_in "Descricao chamado", with: @chamado.descricao_chamado
    fill_in "Observacoes", with: @chamado.observacoes
    fill_in "Status", with: @chamado.status_id
    fill_in "Tipo", with: @chamado.tipo_id
    click_on "Update Chamado"

    assert_text "Chamado was successfully updated"
    click_on "Back"
  end

  test "destroying a Chamado" do
    visit chamados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chamado was successfully destroyed"
  end
end

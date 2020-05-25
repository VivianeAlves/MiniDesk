require "application_system_test_case"

class SetoresTest < ApplicationSystemTestCase
  setup do
    @setor = setores(:one)
  end

  test "visiting the index" do
    visit setores_url
    assert_selector "h1", text: "Setores"
  end

  test "creating a Setor" do
    visit setores_url
    click_on "New Setor"

    fill_in "Nome", with: @setor.nome
    fill_in "Ramal", with: @setor.ramal
    fill_in "Sigla", with: @setor.sigla
    click_on "Create Setor"

    assert_text "Setor was successfully created"
    click_on "Back"
  end

  test "updating a Setor" do
    visit setores_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @setor.nome
    fill_in "Ramal", with: @setor.ramal
    fill_in "Sigla", with: @setor.sigla
    click_on "Update Setor"

    assert_text "Setor was successfully updated"
    click_on "Back"
  end

  test "destroying a Setor" do
    visit setores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Setor was successfully destroyed"
  end
end

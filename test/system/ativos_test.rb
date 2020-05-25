require "application_system_test_case"

class AtivosTest < ApplicationSystemTestCase
  setup do
    @ativo = ativos(:one)
  end

  test "visiting the index" do
    visit ativos_url
    assert_selector "h1", text: "Ativos"
  end

  test "creating a Ativo" do
    visit ativos_url
    click_on "New Ativo"

    fill_in "Descricao ativo", with: @ativo.descricao_ativo
    fill_in "References", with: @ativo.references
    click_on "Create Ativo"

    assert_text "Ativo was successfully created"
    click_on "Back"
  end

  test "updating a Ativo" do
    visit ativos_url
    click_on "Edit", match: :first

    fill_in "Descricao ativo", with: @ativo.descricao_ativo
    fill_in "References", with: @ativo.references
    click_on "Update Ativo"

    assert_text "Ativo was successfully updated"
    click_on "Back"
  end

  test "destroying a Ativo" do
    visit ativos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ativo was successfully destroyed"
  end
end

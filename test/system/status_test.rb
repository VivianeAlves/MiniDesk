require "application_system_test_case"

class StatusTest < ApplicationSystemTestCase
  setup do
    @status = status(:one)
  end

  test "visiting the index" do
    visit status_url
    assert_selector "h1", text: "Status"
  end

  test "creating a Status" do
    visit status_url
    click_on "New Status"

    fill_in "Descricao status", with: @status.descricao_status
    click_on "Create Status"

    assert_text "Status was successfully created"
    click_on "Back"
  end

  test "updating a Status" do
    visit status_url
    click_on "Edit", match: :first

    fill_in "Descricao status", with: @status.descricao_status
    click_on "Update Status"

    assert_text "Status was successfully updated"
    click_on "Back"
  end

  test "destroying a Status" do
    visit status_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Status was successfully destroyed"
  end
end

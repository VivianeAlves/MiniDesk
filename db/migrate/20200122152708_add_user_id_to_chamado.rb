class AddUserIdToChamado < ActiveRecord::Migration[5.2]
  def change
    add_reference :chamados, :usuario, foreign_key: true, null: false
  end
end

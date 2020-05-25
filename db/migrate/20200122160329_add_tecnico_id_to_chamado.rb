class AddTecnicoIdToChamado < ActiveRecord::Migration[5.2]
  def change
    add_reference :chamados, :tecnico, foreign_key: true
  end
end

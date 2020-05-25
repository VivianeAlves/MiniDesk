class AddCamposToChamado < ActiveRecord::Migration[5.2]
  def change
    add_reference :chamados, :setor, foreign_key: true
    add_column :chamados, :prioridade, :string
    add_column :chamados, :data_chamado, :date
    add_column :chamados, :hora_chamado, :time
  end
end

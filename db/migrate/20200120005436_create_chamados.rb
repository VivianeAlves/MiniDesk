class CreateChamados < ActiveRecord::Migration[5.2]
  def change
    create_table :chamados do |t|
      t.references :tipo, foreign_key: true, null: false
      t.references :status, foreign_key: true, null: false
      t.references :ativo, foreign_key: true, null: false
      t.string :titulo, null: false
      t.text :descricao_chamado, null: false
      t.references :acao, foreign_key: true
      t.datetime :data_abertura, null: false
      t.text :resolucao

      t.timestamps
    end
  end
end

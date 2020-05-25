class CreateAcoes < ActiveRecord::Migration[5.2]
  def change
    create_table :acoes do |t|
      t.string :descricao_acao, null: false

      t.timestamps
    end
  end
end

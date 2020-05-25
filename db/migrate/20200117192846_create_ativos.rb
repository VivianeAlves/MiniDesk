class CreateAtivos < ActiveRecord::Migration[5.2]
  def change
    create_table :ativos do |t|
      t.string :descricao_ativo, null: false
      t.timestamps
    end
  end
end

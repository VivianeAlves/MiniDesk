class CreateChamadoTecnicos < ActiveRecord::Migration[5.2]
  def change
    create_table :chamado_tecnicos do |t|
      t.references :usuario, foreign_key: true, null: false
      t.references :chamado, foreign_key: true, null: false

      t.timestamps
    end
  end
end

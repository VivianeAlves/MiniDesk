class CreateChamadoUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :chamado_usuarios do |t|
      t.references :usuario, foreign_key: true, null: false
      t.references :chamado, foreign_key: true, null: false

      t.timestamps
    end
  end
end

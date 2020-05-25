class CreateTecnicos < ActiveRecord::Migration[5.2]
  def change
    create_table :tecnicos do |t|
      t.references :usuario, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end

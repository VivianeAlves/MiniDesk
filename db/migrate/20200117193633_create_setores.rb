class CreateSetores < ActiveRecord::Migration[5.2]
  def change
    create_table :setores do |t|
      t.string :nome, limit: 70, null: false
      t.string :sigla, limit: 3
      t.integer :ramal, limit: 4

      t.timestamps
    end
  end
end

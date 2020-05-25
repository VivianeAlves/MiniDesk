class CreateStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :status do |t|
      t.string :descricao_status

      t.timestamps
    end
  end
end

class AddColumnSetorIdToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_reference :usuarios, :setor, foreign_key: true
  end
end

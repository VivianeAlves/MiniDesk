class RemoveColumnPerfilOnUsuarios < ActiveRecord::Migration[5.2]
  def change
    remove_column :usuarios, :perfil
  end
end

module UsuariosHelper
  def usuario_eh_tecnico?(usuario = current_usuario.id)
    !Usuario.find(usuario).tecnico.nil?
  end

  def tecnico_eh_admin?
    current_usuario.tecnico.admin
  end

  def current_user
    current_usuario
  end

  def current_user_eh_tecnico
    Usuario.current.tecnico != nil
  end

  def compare_id_tecnico_with_current_user(tecnico_id)
    if (tecnico_id == Usuario.current.tecnico.id)
      puts "tecnico e current_usuario são a mesma pessoa"
      return true
    end
  end

end

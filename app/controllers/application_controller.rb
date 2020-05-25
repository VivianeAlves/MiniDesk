class ApplicationController < ActionController::Base
  protect_from_forgery :except => :null_session
  before_action :authenticate_usuario!
  before_action :set_current_usuario_no_model
  include UsuariosHelper

  # a função seta o current_usuario do devise na função current do model Usuario
  # permitindo assim acessar o usuario que está logado usando Usuario.current
  # que por sua vez pode ser usado em outros models
  def set_current_usuario_no_model
    Usuario.current = current_usuario
  end

  # @todo decidir quais modelos/dados podem ser excluídos e quais devem ser desativados

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Acesso Negado!"
    redirect_to "/denied_access.html", alert: exception.message
  end

  def index
    if usuario_signed_in?
      if usuario_eh_tecnico?
        redirect_to "/chamados/atribuidos"
      else
        redirect_to "/chamados/solicitacoes"
      end
    else
      redirect_to "/accounts/sign_in"
    end
  end
end

class Chamado < ApplicationRecord
  include UsuariosHelper
  belongs_to :tipo
  belongs_to :status
  belongs_to :ativo
  belongs_to :acao
  belongs_to :usuario
  belongs_to :tecnico
  validates_presence_of :titulo, :descricao_chamado, :setor_id, :tipo_id, :ativo_id
  validate :checar_status_e_acao, on: [:create, :update]
  validate :checar_status_e_resolução, on: [:create, :update]
  validate :checar_usuario_e_tecnico, if: :usuario_tecnico, on: [:create, :update]
  validate :checar_usuario_e_tecnico_logado, if: :usuario_tecnico, on: [:create, :update]
  include PgSearch

  pg_search_scope :search_by_id, against: [:id], using: {
      tsearch: {
          prefix: true
      }
  }

  def usuario_tecnico
    usuario_eh_tecnico?(usuario_id)
  end


  def checar_status_e_acao
    #caso status == fechado e acao == N/A pedir para usuario inserir ação
    #as ids podem mudar caso haja uma nova população de tabela
    # @todo retirar ids e verificar por descrição chamado
    errors.add(" ",
               "Insira uma ação") if status_id == 2 && acao_id == 2
  end

  def checar_status_e_resolução
    errors.add(" ",
               "Insira a resolução") if status_id == 2 && resolucao == ""
  end

  def checar_usuario_e_tecnico
    errors.add(" ",
               "A pessoa que abriu o chamado não pode ser a mesma que irá atendê-lo") if Usuario.find(usuario_id).tecnico.id == tecnico_id
  end

  def checar_usuario_e_tecnico_logado
    if usuario_eh_tecnico?(usuario_id) && current_user_eh_tecnico
      puts "executou"
      if compare_id_tecnico_with_current_user(tecnico_id) && Usuario.find(usuario_id).tecnico.id == tecnico_id
        errors.add(" ",
                   "Voce nao pode atribuir um chamado a si mesmo")
      end
    end
  end
end
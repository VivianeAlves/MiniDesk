class ChamadosController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_chamado, only: [:show, :edit, :update, :destroy]
  # @todo testar rest

  def index
    if params[:term] and params[:term].size > 0
      @chamados = Chamado.search_by_id(params[:term]).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
      @chamados = Chamado.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
  end

  #@todo autenticacao em json para acessar chamados de em usuario em especifico
  def solicitacoes
    @chamados = Chamado.where("usuario_id='#{current_usuario.id}'").paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def abertos
    @chamados = Chamado.where("status_id='1'").paginate(page: params[:page], per_page: 5).order('created_at DESC')
    #TODO - Criar seed com dados default para cada tabela
  end

  def atribuidos
    if usuario_eh_tecnico?
      @chamados = Chamado.where("tecnico_id ='#{current_usuario.tecnico.id}'").paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
      redirect_to "/denied_access.html"
    end
  end

  def show
    responde_js
  end

  def new
    @chamado = Chamado.new
    @chamado.acao_id = 2
    @chamado.status_id = 1
    @chamado.setor_id = current_usuario.setor_id
    responde_js
  end

  def edit
    responde_js
  end

  def create
    @chamado = Chamado.new(chamado_params)
    @chamado.data_abertura = Time.now
    @chamado.data_chamado = Time.now.getlocal.strftime("%d/%m/%Y")
    @chamado.hora_chamado = Time.now.getlocal.strftime("%H:%M:%S")

    respond_to do |f|
      if @chamado.save
        f.html {redirect_to chamados_url, notice: 'Chamado foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @chamado.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |f|
      if @chamado.update(chamado_params)
        f.html {redirect_to chamados_url, notice: 'O chamado foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @chamado.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @chamado.destroy
    respond_to do |format|
      format.html {redirect_to chamados_url, notice: 'Chamado was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def responde_js
    respond_to do |f|
      f.js
      f.json
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_chamado
    @chamado = Chamado.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def chamado_params
    params.require(:chamado).permit(:tipo_id, :status_id, :ativo_id, :descricao_chamado, :acao_id, :resolucao, :titulo, :usuario_id, :tecnico_id, :prioridade, :setor_id)
  end
end

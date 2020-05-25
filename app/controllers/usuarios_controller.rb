class UsuariosController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :find_usuario_id, only: [:edit, :destroy, :update, :show]
  # @todo criar link tela resetar senhas
  # @todo testar rest
  # @todo permitir que usuario edite seu proprio perfil
  def index
    if params[:term] and params[:term].size > 0
      @usuarios = Usuario.search_by_nome(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @usuarios = Usuario.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @usuario = Usuario.new
    responde_js
  end

  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |f|
      if @usuario.save
        f.html { redirect_to usuarios_url, notice: 'Usuário foi criado!' }
        f.json { head :ok }
      else
        f.js
        f.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    responde_js
  end

  def show
    responde_js
  end

  def update
    respond_to do |f|
      if @usuario.update(usuario_params)
        f.html { redirect_to usuarios_url, notice: 'O usuário foi atualizado com sucesso!' }
        f.json { head :ok }
      else
        f.js
        f.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuário foi deletado.' }
      format.json { head :no_content }
    end
  end

  private

  def responde_js
    respond_to do |f|
      f.js
      f.json
    end
  end

  def find_usuario_id
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :celular, :email, :password, :setor_id)
  end

end

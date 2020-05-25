class TecnicosController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_tecnico, only: [:show, :edit, :update, :destroy]

  #@todo testar rest
  def index
      @tecnicos = Tecnico.paginate(page: params[:page], per_page: 5)
  end

  def show
    responde_js
  end

  def new
    @tecnico = Tecnico.new
    responde_js
  end

  def edit
    responde_js
  end

  def create
    @tecnico = Tecnico.new(tecnico_params)
    respond_to do |f|
      if @tecnico.save
        f.html {redirect_to tecnicos_url, notice: 'Tecnico foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @tecnico.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |f|
      if @tecnico.update(tecnico_params)
        f.html {redirect_to tecnicos_url, notice: 'O tecnico foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @tecnico.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tecnicos/1
  # DELETE /tecnicos/1.json
  def destroy
    @tecnico.destroy
    respond_to do |format|
      format.html {redirect_to tecnicos_url, notice: 'Tecnico was successfully destroyed.'}
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
  def set_tecnico
    @tecnico = Tecnico.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tecnico_params
    params.require(:tecnico).permit(:usuario_id, :admin)
  end
end

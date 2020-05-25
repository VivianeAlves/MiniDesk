class AtivosController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_ativo, only: [:show, :edit, :update, :destroy]
#@todo testar rest

  def index
    if params[:term] and params[:term].size > 0
      @ativos = Ativo.search_by_descricao_ativo(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @ativos = Ativo.paginate(page: params[:page], per_page: 5)
    end
  end

# GET /ativos/1
# GET /ativos/1.json
  def show
    responde_js
  end

# GET /ativos/new
  def new
    @ativo = Ativo.new
    responde_js
  end

# GET /ativos/1/edit
  def edit
    responde_js
  end

# POST /ativos
# POST /ativos.json
  def create
    @ativo = Ativo.new(ativo_params)
    respond_to do |f|
      if @ativo.save
        f.html {redirect_to ativos_url, notice: 'Ativo foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @ativo.errors, status: :unprocessable_entity}
      end
    end
  end

# PATCH/PUT /ativos/1
# PATCH/PUT /ativos/1.json
  def update
    respond_to do |f|
      if @ativo.update(ativo_params)
        f.html {redirect_to ativos_url, notice: 'O ativo foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @ativo.errors, status: :unprocessable_entity}
      end
    end
  end

# DELETE /ativos/1
# DELETE /ativos/1.json
  def destroy
    @ativo.destroy
    respond_to do |format|
      format.html {redirect_to ativos_url, notice: 'Ativo foi deletado.'}
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
  def set_ativo
    @ativo = Ativo.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def ativo_params
    params.require(:ativo).permit(:descricao_ativo)
  end
end

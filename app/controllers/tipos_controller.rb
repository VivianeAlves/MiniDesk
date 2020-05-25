class TiposController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_tipo, only: [:show, :edit, :update, :destroy]
  #@todo testar rest
  # GET /tipos
  # GET /tipos.json
  def index
    if params[:term] and params[:term].size > 0
      @tipos = Tipo.search_by_descricao_tipo(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @tipos = Tipo.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
    responde_js
  end

  def new
    @tipo = Tipo.new
    responde_js
  end

  # GET /tipos/1/edit
  def edit
    responde_js
  end

  # POST /tipos
  # POST /tipos.json
  def create
    @tipo = Tipo.new(tipo_params)

    respond_to do |f|
      if @tipo.save
        f.html {redirect_to tipos_url, notice: 'Tipo foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @tipo.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tipos/1
  # PATCH/PUT /tipos/1.json
  def update
    respond_to do |f|
      if @tipo.update(tipo_params)
        f.html {redirect_to tipos_url, notice: 'O tipo foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @tipo.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tipos/1
  # DELETE /tipos/1.json
  def destroy
    @tipo.destroy
    respond_to do |format|
      format.html { redirect_to tipos_url, notice: 'Tipo was successfully destroyed.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_params
      params.require(:tipo).permit(:descricao_tipo)
    end
end

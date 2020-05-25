class SetoresController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_setor, only: [:show, :edit, :update, :destroy]
  # @todo testar rest

# GET /setores
# GET /setores.json
  def index
    if params[:term] and params[:term].size > 0
      @setores = Setor.search_by_nome_setor(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @setores = Setor.paginate(page: params[:page], per_page: 5)
    end
  end

# GET /setores/1
# GET /setores/1.json
  def show
    responde_js
  end

# GET /setores/new
  def new
    @setor = Setor.new
    responde_js
  end

# GET /setores/1/edit
  def edit
    responde_js
  end

# POST /setores
# POST /setores.json
  def create
    @setor = Setor.new(setor_params)

    respond_to do |f|
      if @setor.save
        f.html {redirect_to setores_url, notice: 'Setor foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @setor.errors, status: :unprocessable_entity}
      end
    end
  end

# PATCH/PUT /setores/1
# PATCH/PUT /setores/1.json
  def update
    respond_to do |f|
      if @setor.update(setor_params)
        f.html {redirect_to setores_url, notice: 'O setor foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @setor.errors, status: :unprocessable_entity}
      end
    end
  end

# DELETE /setores/1
# DELETE /setores/1.json
  def destroy
    @setor.destroy
    respond_to do |format|
      format.html {redirect_to setores_url, notice: 'Setor was successfully destroyed.'}
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
  def set_setor
    @setor = Setor.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def setor_params
    params.require(:setor).permit(:nome, :sigla, :ramal)
  end
end

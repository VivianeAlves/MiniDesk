class AcoesController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_acao, only: [:show, :edit, :update, :destroy]

  def index
    if params[:term] and params[:term].size > 0
      @acoes = Acao.search_by_descricao_acao(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @acoes = Acao.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
  end

  def show
    responde_js
  end

  def new
    @acao = Acao.new
    responde_js
  end

  def edit
    responde_js
  end

  def create
    @acao = Acao.new(acao_params)
    respond_to do |f|
      if @acao.save
        f.html {redirect_to acoes_url, notice: 'A ação foi salva com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @acao.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /acoes/1
  # PATCH/PUT /acoes/1.json
  def update
    respond_to do |f|
      if @acao.update(acao_params)
        f.html {redirect_to acoes_url, notice: 'A ação foi atualizada com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @acao.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /acoes/1
  # DELETE /acoes/1.json
  def destroy
    @acao.destroy
    respond_to do |format|
      format.html {redirect_to acoes_url, notice: 'Acao was successfully destroyed.'}
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

  def set_acao
    @acao = Acao.find(params[:id])
  end

  def acao_params
    params.require(:acao).permit(:descricao_acao)
  end
end

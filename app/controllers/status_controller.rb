class StatusController < ApplicationController
  include UsuariosHelper
  load_and_authorize_resource
  before_action :set_status, only: [:show, :edit, :update, :destroy]
#@todo testar rest
# GET /status
# GET /status.json
  def index
    if params[:term] and params[:term].size > 0
      @status = Status.search_by_descricao_status(params[:term]).paginate(page: params[:page], per_page: 5)
    else
      @status = Status.paginate(page: params[:page], per_page: 5)
    end
  end

# GET /status/1
# GET /status/1.json
  def show
    responde_js
  end

# GET /status/new
  def new
    @status = Status.new
    responde_js
  end

# GET /status/1/edit
  def edit
    responde_js
  end

# POST /status
# POST /status.json
  def create
    @status = Status.new(status_params)
    respond_to do |f|
      if @status.save
        f.html {redirect_to status_index_url, notice: 'Status foi criado!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @status.errors, status: :unprocessable_entity}
      end
    end
  end

# PATCH/PUT /status/1
# PATCH/PUT /status/1.json
  def update
    respond_to do |f|
      if @status.update(status_params)
        f.html {redirect_to status_index_url, notice: 'O status foi atualizado com sucesso!'}
        f.json {head :ok}
      else
        f.js
        f.json {render json: @status.errors, status: :unprocessable_entity}
      end
    end
  end

# DELETE /status/1
# DELETE /status/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html {redirect_to status_index_url, notice: 'Status was successfully destroyed.'}
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
  def set_status
    @status = Status.find(params[:id])
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def status_params
    params.require(:status).permit(:descricao_status)
  end
end
